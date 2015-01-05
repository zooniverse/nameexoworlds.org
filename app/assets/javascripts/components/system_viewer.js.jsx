var SystemViewer = React.createClass({
  getDefaultProps:function(){
    return {width:400, height: 400, star_scale: 10, star_mag:2, planets:[]};
  },
  getInitialState:function(){
    return {t: 0};
  },
  updateTime: function(){
    this.setState({t: this.state.t + 1})
    window.requestAnimationFrame(this.updateTime)
  },
  componentDidMount:function(){
    window.requestAnimationFrame(this.updateTime)
  },
  center_x:function(){
    return this.props.width/2.0;
  },
  center_y:function(){
    return this.props.height/2.0;
  },
  planet_orbit:function(planet,index){
    return(
      <circle key={"planet_orbit"+index} r={this.orbit_radius(planet)} strokeWidth={1} fill={"none"} stroke={"white"} cx={this.center_x()} cy={this.center_y()}></circle>
    )
  },

  planet_scale:function(){
    if(this.props.planet_scale){
      return this.props.planet_scale;
    }
    max_mass = Math.max.apply(null,this.props.planets.map(function(p){return p.mass_jup}))
    return max_mass;
  },

  planet_radius:function(planet){
    return Math.max(this.props.width*0.1*planet.mass_jup/this.planet_scale(),3)
  },

  planet_orbit_scale:function(){
    if(this.props.orbit_scale){
      return this.props.orbit_scale;
    }
    max_orbit = Math.max.apply(null,this.props.planets.map(function(p){return p.semi_major}))
    return  max_orbit
  },

  orbit_radius:function(planet){
    return Math.max(this.props.width*0.9*0.5*planet.semi_major/this.planet_orbit_scale(), 10);
  },

  position_for_planet:function(planet){
    x = this.orbit_radius(planet) * Math.cos( this.state.t/planet.period ) + this.center_x()
    y = this.orbit_radius(planet) * Math.sin( this.state.t/planet.period ) + this.center_y()
    return {x:x, y:y}
  },

  planet_circle:function(planet,index){
    pos = this.position_for_planet(planet)
    return(
      <circle key={"planet_circle"+index} r={this.planet_radius(planet)} fill={"red"} cx={pos.x} cy={pos.y}></circle>
    )
  },

  render: function() {

    p_dots  = this.props.planets.map(this.planet_circle)
    orbits  = this.props.planets.map(this.planet_orbit)
    return(
      <svg width={this.props.width} height={this.props.height}>

        <circle stroke={"red"} fill={"none"} cx={this.planet_radius({mass_jup: 1})+10} cy={this.planet_radius({mass_jup: 1})+10} r={this.planet_radius({mass_jup: 1})}></circle>
        <text x={this.planet_radius({mass_jup: 1})*2 + 15 } y={this.planet_radius({mass_jup: 1})+15} fill="white">1 jupiter mass</text>

        <line x1={this.props.width - 40} x2={this.props.width - 5} y1={10} y2={10} stroke={"green"}></line>

        <circle fill={"yellow"} r={10} cx={this.center_x()} cy={this.center_y()}></circle>
        <circle fill={"none"} stroke={"green"} cx={this.center_x()} cy={this.center_y()} r={this.orbit_radius({semi_major: 1.0})}></circle>
        <text x={this.props.width - 80} y="15" fill="white">1 Astronomical Unit</text>

        {orbits}
        {p_dots}
      </svg>
    )
  }
});

window.SystemViewer = SystemViewer

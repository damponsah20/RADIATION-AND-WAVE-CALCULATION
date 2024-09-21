program calculate_radiation !

  implicit none  ! enforce explicit variable declarations!!

  ! Declare constants for Planck's constant, the speed of light, and the Stefan-Boltzmann constant
  real, parameter :: PLANCK = 6.626*10.0**(-34), SPEED_OF_LIGHT = 3.0*10.0**8, BOLTZMANN = 5.67*10.0**(-8) 

  ! Declare arrays to store temperature, energy, and wavelength data
  real, dimension(10) :: temperature, energy, wavelength ! 

  ! Declare loop counter variable
  integer :: index 

  ! Open the file 'data.txt' for reading
  open(unit=36, file='data.txt', status='old') 

  ! Print a header line for the table
  print "('Temperature (K)', 2x , 'Energy (J)', 3X, 'Wavelength (m)')" 

  ! Loop over each line in the file, reading in the temperature data
  do index = 1, 10 !1
    read(36, *) temperature(index)

    ! Convert the temperature from Celsius to Kelvin
    temperature(index) = 273.15 + temperature(index)

    ! Calculate the energy of blackbody radiation using Planck's law
    energy(index) = BOLTZMANN * temperature(index)**4  

    ! Calculate the wavelength of the radiation using the energy and Planck's constant
    wavelength(index) = PLANCK * SPEED_OF_LIGHT / energy(index) 

    ! Print the temperature, energy, wavelength, and frequency to the console using a loop
    write(*, '( F5.1, " K", 5x , E13.2, " J", 6x , E13.2, " m")') temperature(index), energy(index), wavelength(index) 

  end do

  ! Close the file 'radiation_data.txt'
  close(36)

end program calculate_radiation 


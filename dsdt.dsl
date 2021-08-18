/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190509 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat, Wed Aug 18 08:29:03 2021
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00004853 (18515)
 *     Revision         0x02
 *     Checksum         0x44
 *     OEM ID           "PRLS  "
 *     OEM Table ID     "PRLSACPI"
 *     OEM Revision     0x00001001 (4097)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "DSDT", 2, "PRLS  ", "PRLSACPI", 0x00001001)
{
    Name (VERS, Package (0x03)
    {
        "Project: PRLS", 
        "Date: 26/10/2009", 
        "Vers: 1.00.02"
    })
    OperationRegion (PT80, SystemIO, 0x80, One)
    Field (PT80, ByteAcc, NoLock, Preserve)
    {
        P80T,   8
    }

    OperationRegion (MOND, SystemIO, 0x0990, 0x04)
    Field (MOND, DWordAcc, NoLock, Preserve)
    {
        DEBM,   32
    }

    Name (PICF, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        PICF = Arg0
    }

    OperationRegion (PMIO, SystemIO, 0x4000, 0x4F)
    Field (PMIO, DWordAcc, NoLock, Preserve)
    {
        Offset (0x01), 
        PBST,   1, 
        Offset (0x02)
    }

    Scope (_SB)
    {
        Mutex (PRM, 0x01)
        OperationRegion (PRST, SystemIO, 0x0810, 0x08)
        Field (PRST, DWordAcc, NoLock, WriteAsZeros)
        {
            PRS,    32
        }

        OperationRegion (PRSN, SystemIO, 0x0818, 0x08)
        Field (PRSN, DWordAcc, NoLock, WriteAsZeros)
        {
            PRN,    32
        }

        Method (CPST, 1, NotSerialized)
        {
            Acquire (PRM, 0xFFFF)
            If ((PRS & (One << Arg0)))
            {
                Local0 = 0x0F
            }
            Else
            {
                Local0 = Zero
            }

            Release (PRM)
            Return (Local0)
        }

        Method (CPMA, 1, NotSerialized)
        {
            Local0 = Buffer (0x08)
                {
                     0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            Local0 [0x02] = Arg0
            Local0 [0x03] = Arg0
            Acquire (PRM, 0xFFFF)
            If ((PRS & (One << Arg0)))
            {
                Local0 [0x04] = One
            }

            Release (PRM)
            Return (Local0)
        }

        Processor (CPU0, 0x00, 0x00004010, 0x06)
        {
            Name (ID, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU1, 0x01, 0x00004010, 0x06)
        {
            Name (ID, One)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU2, 0x02, 0x00004010, 0x06)
        {
            Name (ID, 0x02)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU3, 0x03, 0x00004010, 0x06)
        {
            Name (ID, 0x03)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU4, 0x04, 0x00004010, 0x06)
        {
            Name (ID, 0x04)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU5, 0x05, 0x00004010, 0x06)
        {
            Name (ID, 0x05)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU6, 0x06, 0x00004010, 0x06)
        {
            Name (ID, 0x06)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU7, 0x07, 0x00004010, 0x06)
        {
            Name (ID, 0x07)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU8, 0x08, 0x00004010, 0x06)
        {
            Name (ID, 0x08)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPU9, 0x09, 0x00004010, 0x06)
        {
            Name (ID, 0x09)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUA, 0x0A, 0x00004010, 0x06)
        {
            Name (ID, 0x0A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUB, 0x0B, 0x00004010, 0x06)
        {
            Name (ID, 0x0B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUC, 0x0C, 0x00004010, 0x06)
        {
            Name (ID, 0x0C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUD, 0x0D, 0x00004010, 0x06)
        {
            Name (ID, 0x0D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUE, 0x0E, 0x00004010, 0x06)
        {
            Name (ID, 0x0E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUF, 0x0F, 0x00004010, 0x06)
        {
            Name (ID, 0x0F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUG, 0x10, 0x00004010, 0x06)
        {
            Name (ID, 0x10)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUH, 0x11, 0x00004010, 0x06)
        {
            Name (ID, 0x11)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUI, 0x12, 0x00004010, 0x06)
        {
            Name (ID, 0x12)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUJ, 0x13, 0x00004010, 0x06)
        {
            Name (ID, 0x13)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUK, 0x14, 0x00004010, 0x06)
        {
            Name (ID, 0x14)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUL, 0x15, 0x00004010, 0x06)
        {
            Name (ID, 0x15)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUM, 0x16, 0x00004010, 0x06)
        {
            Name (ID, 0x16)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUN, 0x17, 0x00004010, 0x06)
        {
            Name (ID, 0x17)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUO, 0x18, 0x00004010, 0x06)
        {
            Name (ID, 0x18)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUP, 0x19, 0x00004010, 0x06)
        {
            Name (ID, 0x19)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUQ, 0x1A, 0x00004010, 0x06)
        {
            Name (ID, 0x1A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUR, 0x1B, 0x00004010, 0x06)
        {
            Name (ID, 0x1B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUS, 0x1C, 0x00004010, 0x06)
        {
            Name (ID, 0x1C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUT, 0x1D, 0x00004010, 0x06)
        {
            Name (ID, 0x1D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUU, 0x1E, 0x00004010, 0x06)
        {
            Name (ID, 0x1E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Processor (CPUV, 0x1F, 0x00004010, 0x06)
        {
            Name (ID, 0x1F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CPST (ID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CPMA (ID))
            }

            Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
            {
                Acquire (PRM, 0xFFFF)
                PRS &= ~(One << ID)
                Release (PRM)
            }

            Name (_CST, Package (0x02)  // _CST: C-States
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    0x14, 
                    0x03E8
                }
            })
        }

        Method (CPNT, 2, NotSerialized)
        {
            If ((Arg0 == One))
            {
                Notify (CPU1, Arg1)
            }

            If ((Arg0 == 0x02))
            {
                Notify (CPU2, Arg1)
            }

            If ((Arg0 == 0x03))
            {
                Notify (CPU3, Arg1)
            }

            If ((Arg0 == 0x04))
            {
                Notify (CPU4, Arg1)
            }

            If ((Arg0 == 0x05))
            {
                Notify (CPU5, Arg1)
            }

            If ((Arg0 == 0x06))
            {
                Notify (CPU6, Arg1)
            }

            If ((Arg0 == 0x07))
            {
                Notify (CPU7, Arg1)
            }

            If ((Arg0 == 0x08))
            {
                Notify (CPU8, Arg1)
            }

            If ((Arg0 == 0x09))
            {
                Notify (CPU9, Arg1)
            }

            If ((Arg0 == 0x0A))
            {
                Notify (CPUA, Arg1)
            }

            If ((Arg0 == 0x0B))
            {
                Notify (CPUB, Arg1)
            }

            If ((Arg0 == 0x0C))
            {
                Notify (CPUC, Arg1)
            }

            If ((Arg0 == 0x0D))
            {
                Notify (CPUD, Arg1)
            }

            If ((Arg0 == 0x0E))
            {
                Notify (CPUE, Arg1)
            }

            If ((Arg0 == 0x0F))
            {
                Notify (CPUF, Arg1)
            }

            If ((Arg0 == 0x10))
            {
                Notify (CPUG, Arg1)
            }

            If ((Arg0 == 0x11))
            {
                Notify (CPUH, Arg1)
            }

            If ((Arg0 == 0x12))
            {
                Notify (CPUI, Arg1)
            }

            If ((Arg0 == 0x13))
            {
                Notify (CPUJ, Arg1)
            }

            If ((Arg0 == 0x14))
            {
                Notify (CPUK, Arg1)
            }

            If ((Arg0 == 0x15))
            {
                Notify (CPUL, Arg1)
            }

            If ((Arg0 == 0x16))
            {
                Notify (CPUM, Arg1)
            }

            If ((Arg0 == 0x17))
            {
                Notify (CPUN, Arg1)
            }

            If ((Arg0 == 0x18))
            {
                Notify (CPUO, Arg1)
            }

            If ((Arg0 == 0x19))
            {
                Notify (CPUP, Arg1)
            }

            If ((Arg0 == 0x1A))
            {
                Notify (CPUQ, Arg1)
            }

            If ((Arg0 == 0x1B))
            {
                Notify (CPUR, Arg1)
            }

            If ((Arg0 == 0x1C))
            {
                Notify (CPUS, Arg1)
            }

            If ((Arg0 == 0x1D))
            {
                Notify (CPUT, Arg1)
            }

            If ((Arg0 == 0x1E))
            {
                Notify (CPUU, Arg1)
            }

            If ((Arg0 == 0x1F))
            {
                Notify (CPUV, Arg1)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (B0PI, 0, NotSerialized)
            {
                Return (Package (0x14)
                {
                    Package (0x04)
                    {
                        0x0002FFFF, 
                        Zero, 
                        Zero, 
                        0x0A
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        Zero, 
                        Zero, 
                        0x0B
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        Zero, 
                        Zero, 
                        0x07
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        Zero, 
                        Zero, 
                        0x05
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        Zero, 
                        Zero, 
                        0x05
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        Zero, 
                        Zero, 
                        0x05
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        Zero, 
                        Zero, 
                        0x05
                    }, 

                    Package (0x04)
                    {
                        0x000EFFFF, 
                        One, 
                        Zero, 
                        0x0B
                    }, 

                    Package (0x04)
                    {
                        0x000FFFFF, 
                        Zero, 
                        Zero, 
                        0x05
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        Zero, 
                        Zero, 
                        0x0A
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        One, 
                        Zero, 
                        0x0A
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x02, 
                        Zero, 
                        0x0A
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x03, 
                        Zero, 
                        0x0A
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        Zero, 
                        Zero, 
                        0x09
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x02, 
                        Zero, 
                        0x09
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x03, 
                        Zero, 
                        0x09
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        Zero, 
                        Zero, 
                        0x0A
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        One, 
                        Zero, 
                        0x0B
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x02, 
                        Zero, 
                        0x09
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x03, 
                        Zero, 
                        0x07
                    }
                })
            }

            Method (B0AP, 0, NotSerialized)
            {
                Return (Package (0x14)
                {
                    Package (0x04)
                    {
                        0x0002FFFF, 
                        Zero, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        Zero, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        Zero, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x000EFFFF, 
                        One, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x000FFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
            }

            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                Local1 = (HFLG & 0x08)
                If ((Local1 && PICF))
                {
                    Return (B0AP ())
                }
                Else
                {
                    Return (B0PI ())
                }
            }

            Device (LNKA)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x09)
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                }
            }

            Device (PX16)
            {
                Method (B1PI, 0, NotSerialized)
                {
                    Return (Package (0x29)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            Zero, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            One, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            0x02, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            0x03, 
                            Zero, 
                            0x0A
                        }
                    })
                }

                Method (B1AP, 0, NotSerialized)
                {
                    Return (Package (0x29)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x02, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x02, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            Zero, 
                            0x0B
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x02, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x02, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            Zero, 
                            0x0B
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x02, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            0x02, 
                            Zero, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            0x02, 
                            Zero, 
                            0x0B
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            Zero, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            0x02, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }
                    })
                }

                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (B1PI ())
                    }
                    Else
                    {
                        Return (B1AP ())
                    }
                }
            }

            Device (PCIN)
            {
                Method (B2PI, 0, NotSerialized)
                {
                    Return (Package (0x14)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x000BFFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x000CFFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x000DFFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x000EFFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x000FFFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            Zero, 
                            Zero, 
                            0x05
                        }
                    })
                }

                Method (B2AP, 0, NotSerialized)
                {
                    Return (Package (0x14)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x0008FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0009FFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x000AFFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x000BFFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x000CFFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x000DFFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x000EFFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x000FFFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }
                    })
                }

                Name (_ADR, 0x000A0000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (B2PI ())
                    }
                    Else
                    {
                        Return (B2AP ())
                    }
                }
            }

            Device (PCI2)
            {
                Method (B3PI, 0, NotSerialized)
                {
                    Return (Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            Zero, 
                            Zero, 
                            0x0B
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            One, 
                            Zero, 
                            0x0B
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            Zero, 
                            0x0B
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            Zero, 
                            0x0B
                        }
                    })
                }

                Method (B3AP, 0, NotSerialized)
                {
                    Return (Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            One, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }
                    })
                }

                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (B3PI ())
                    }
                    Else
                    {
                        Return (B3AP ())
                    }
                }
            }

            Device (EXP1)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PCX1, PCI_Config, 0x40, 0x0100)
                Field (PCX1, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                    Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PEX1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (One)
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x09
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x0A
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x0B
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }
            }

            Device (EXP2)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                OperationRegion (PCX2, PCI_Config, 0x40, 0x0100)
                Field (PCX2, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                    Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PEX2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (One)
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x09
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x0A
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x0B
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }
            }

            Device (EXP3)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                OperationRegion (PCX3, PCI_Config, 0x40, 0x0100)
                Field (PCX3, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                    Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PEX3)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (One)
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x09
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x0A
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x0B
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }
            }

            Device (EXP4)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                OperationRegion (PCX4, PCI_Config, 0x40, 0x0100)
                Field (PCX4, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                    Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PEX4)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (One)
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x09
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x0A
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x0B
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }
            }

            Device (EXP5)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                OperationRegion (PCX5, PCI_Config, 0x40, 0x0100)
                Field (PCX5, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                    Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PEX5)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (One)
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x09
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x0A
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x0B
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }
            }

            Device (EXP6)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                OperationRegion (PCX6, PCI_Config, 0x40, 0x0100)
                Field (PCX6, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                    Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PEX6)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (One)
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (((BFLG & 0x02) || !PICF))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x09
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x0A
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x0B
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }
            }

            OperationRegion (REG0, PCI_Config, 0x70, 0x90)
            Field (REG0, DWordAcc, NoLock, Preserve)
            {
                    ,   1, 
                DLCK,   1, 
                LSMM,   2, 
                USMM,   2, 
                IGMS,   2, 
                Offset (0x70), 
                MMSZ,   32
            }

            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xB0000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x4EC00000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (CRES) /* \_SB_.PCI0.CRES */
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0007)  // _ADR: Address
            }

            Device (IDE0)
            {
                Name (_ADR, 0x001F0001)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Device (PRI)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (MST)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }
                    }

                    Device (SLV)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (SEC)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Device (MST)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }
                    }

                    Device (SLV)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }
                    }
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
            }

            Device (UFS0)
            {
                Name (_UID, Zero)  // _UID: Unique ID
                Name (_ADR, 0x001F0006)  // _ADR: Address
                Name (_CCA, One)  // _CCA: Cache Coherency Attribute
                Device (DEV0)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x08)
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((HFLG & 0x0800))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Device (PRT0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                Device (PRT2)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                Device (PRT3)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                Device (PRT4)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                Device (PRT5)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (NVME)
            {
                Name (_ADR, 0x001F0007)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((HFLG & 0x80))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001F0004)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((HFLG & 0x0200))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x04)
                    {
                        "layout-id", 
                        Buffer (0x04)
                        {
                             0x02, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "PinConfigurations", 
                        Buffer (Zero){}
                    })
                }
            }

            Device (PX40)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                OperationRegion (PIRQ, PCI_Config, 0x60, 0x04)
                Device (KBC)
                {
                    Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((HFLG & 0x0100))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                }

                Device (KBC1)
                {
                    Name (_HID, EisaId ("PNP0320"))  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((HFLG & 0x0100))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03") /* Microsoft PS/2-style Mouse */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((HFLG & One))
                        {
                            Return (ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0070,             // Range Minimum
                                    0x0070,             // Range Maximum
                                    0x01,               // Alignment
                                    0x06,               // Length
                                    )
                            })
                        }

                        Return (ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0070,             // Range Minimum
                                0x0070,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {8}
                        })
                    }
                }

                Device (FDC0)
                {
                    Name (_HID, EisaId ("PNP0700"))  // _HID: Hardware ID
                    Method (FSTA, 0, NotSerialized)
                    {
                        If (LFRE)
                        {
                            Return (Zero)
                        }

                        Local0 = FDCP /* \_SB_.PCI0.FDCP */
                        Local0 &= 0xF0
                        If (Local0)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (FSTA ())
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (DCRS, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F2,             // Range Minimum
                                0x03F2,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {6}
                        })
                        Return (DCRS) /* \_SB_.PCI0.PX40.FDC0._CRS.DCRS */
                    }

                    Method (_FDE, 0, Serialized)  // _FDE: Floppy Disk Enumerate
                    {
                        Local0 = Buffer (0x14)
                            {
                                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0010 */  0x02, 0x00, 0x00, 0x00                           // ....
                            }
                        CreateDWordField (Local0, Zero, FLPF)
                        If (FSTA ())
                        {
                            FLPF = One
                        }

                        Return (Local0)
                    }

                    Method (FPRM, 1, NotSerialized)
                    {
                        Local0 = Package (0x10)
                            {
                                Zero, 
                                0x04, 
                                0x4F, 
                                0x12, 
                                One, 
                                0xDF, 
                                0x02, 
                                0x25, 
                                0x02, 
                                0x12, 
                                0x24, 
                                0xFF, 
                                0x54, 
                                0xF6, 
                                0x0F, 
                                0x08
                            }
                        Local0 [Zero] = Arg0
                        Return (Local0)
                    }

                    Device (FLP0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (FSTA ())
                        }

                        Method (_FDI, 0, NotSerialized)  // _FDI: Floppy Drive Information
                        {
                            Return (FPRM (Zero))
                        }
                    }
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LFRE)
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((HFLG & One))
                        {
                            Return (ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0040,             // Range Minimum
                                    0x0040,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                            })
                        }

                        Return (ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0040,             // Range Minimum
                                0x0040,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {0}
                        })
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LFRE)
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LFRE)
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

                Device (DMA1)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LFRE)
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0094,             // Range Minimum
                            0x0094,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer16, )
                            {4}
                    })
                }

                Device (PNP)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFC000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {13}
                    })
                }

                Device (FWH)
                {
                    Name (_HID, EisaId ("INT0800") /* Intel 82802 Firmware Hub Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Name (DMAP, Package (0x04)
                {
                    Zero, 
                    One, 
                    0x02, 
                    0x03
                })
                Device (SMC)
                {
                    Name (_HID, EisaId ("APP0001"))  // _HID: Hardware ID
                    Name (_CID, "smc-napa")  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((GOST == 0x07))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0300,             // Range Minimum
                            0x0300,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IRQNoFlags ()
                            {5}
                    })
                }

                Device (PEVT)
                {
                    Name (_HID, "QEMU0001")  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0505,             // Range Minimum
                            0x0505,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                    OperationRegion (PEOR, SystemIO, 0x0505, One)
                    Field (PEOR, ByteAcc, NoLock, Preserve)
                    {
                        PEPT,   8
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((HFLG & 0x40))
                        {
                            Return (0x0B)
                        }

                        Return (Zero)
                    }

                    Method (RDPT, 0, NotSerialized)
                    {
                        Local0 = PEPT /* \_SB_.PCI0.PX40.PEVT.PEPT */
                        Return (Local0)
                    }

                    Method (WRPT, 1, NotSerialized)
                    {
                        PEPT = Arg0
                    }
                }

                Device (LPT1)
                {
                    Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (_DDN, "LPT1")  // _DDN: DOS Device Name
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((LFRE || !PRL1))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (PRS1, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {7}
                        })
                        Return (PRS1) /* \_SB_.PCI0.PX40.LPT1._CRS.PRS1 */
                    }
                }

                Device (LPT2)
                {
                    Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_DDN, "LPT2")  // _DDN: DOS Device Name
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((LFRE || !PRL2))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (PRS2, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {5}
                        })
                        Return (PRS2) /* \_SB_.PCI0.PX40.LPT2._CRS.PRS2 */
                    }
                }

                Device (LPT3)
                {
                    Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Name (_DDN, "LPT3")  // _DDN: DOS Device Name
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((LFRE || !PRL3))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (PRS3, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x04,               // Alignment
                                0x03,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {7}
                        })
                        Return (PRS3) /* \_SB_.PCI0.PX40.LPT3._CRS.PRS3 */
                    }
                }

                Device (COM1)
                {
                    Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (_DDN, "COM1")  // _DDN: DOS Device Name
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (SRL1)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (UIR1, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                        })
                        Return (UIR1) /* \_SB_.PCI0.PX40.COM1._CRS.UIR1 */
                    }
                }

                Device (COM2)
                {
                    Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_DDN, "COM2")  // _DDN: DOS Device Name
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((LFRE || !SRL2))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (UIR2, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                        })
                        Return (UIR2) /* \_SB_.PCI0.PX40.COM2._CRS.UIR2 */
                    }
                }

                Device (COM3)
                {
                    Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Name (_DDN, "COM3")  // _DDN: DOS Device Name
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((LFRE || !SRL3))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (UIR3, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {11}
                        })
                        Return (UIR3) /* \_SB_.PCI0.PX40.COM3._CRS.UIR3 */
                    }
                }

                Device (COM4)
                {
                    Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Name (_DDN, "COM4")  // _DDN: DOS Device Name
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((LFRE || !SRL4))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (UIR4, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {10}
                        })
                        Return (UIR4) /* \_SB_.PCI0.PX40.COM4._CRS.UIR4 */
                    }
                }
            }
        }

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Local1 = ^PCI0.HFLG /* \_SB_.PCI0.HFLG */
            If ((Local1 & 0x10))
            {
                If ((Arg0 == ToUUID ("0811b06e-4a27-44f9-8d60-3cbbc22e7b48") /* Platform-wide Capabilities */))
                {
                    Return (Arg3)
                }

                If ((Arg0 == ToUUID ("ed855e0c-6c90-47bf-a62a-26de0fc5ad5c")))
                {
                    Return (Arg3)
                }
            }

            CreateDWordField (Arg3, Zero, CDW1)
            CDW1 |= 0x04
            Return (Arg3)
        }
    }

    Scope (_SB.PCI0.PX40)
    {
        Device (EC)
        {
            Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_GPE, 0x0A)  // _GPE: General Purpose Events
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((BATC != Zero))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            OperationRegion (ECOR, EmbeddedControl, Zero, 0xFF)
            Field (ECOR, ByteAcc, Lock, Preserve)
            {
                Offset (0x20), 
                SPTR,   8, 
                SSTS,   8, 
                SADR,   8, 
                SCMD,   8, 
                SBFR,   256, 
                SCNT,   8, 
                SAAD,   8, 
                SAD0,   8, 
                SAD1,   8, 
                SMUX,   8
            }

            Field (ECOR, ByteAcc, Lock, Preserve)
            {
                Offset (0x24), 
                SBDW,   16, 
                Offset (0x46), 
                SADW,   16
            }

            Name (ECOK, Zero)
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((BATC != Zero))
                {
                    ECOK = Arg1
                }
            }

            Device (SMB0)
            {
                Name (_HID, "ACPI0001" /* SMBus 1.0 Host Controller */)  // _HID: Hardware ID
                Name (_EC, 0x2030)  // _EC_: Embedded Controller
                Mutex (SMTX, 0x00)
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((GOST == 0x07))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }

                Device (SBS0)
                {
                    Name (_HID, "ACPI0002" /* Smart Battery Subsystem */)  // _HID: Hardware ID
                    Name (_SBS, One)  // _SBS: Smart Battery Subsystem
                }

                Method (SBPC, 1, NotSerialized)
                {
                    Local0 = Arg0
                    While (Local0)
                    {
                        If ((SPTR == Zero))
                        {
                            Return ((SSTS & 0x1F))
                        }

                        Sleep (One)
                        Local0--
                    }

                    Return (0x18)
                }

                Method (SBRW, 3, NotSerialized)
                {
                    Local0 = One
                    If (!Acquire (SMTX, 0xFFFF))
                    {
                        If ((SPTR == Zero))
                        {
                            SADR = (Arg0 << One)
                            SCMD = Arg1
                            SPTR = 0x09
                            Local0 = SBPC (0x03E8)
                            If (!Local0)
                            {
                                Arg2 = SBDW /* \_SB_.PCI0.PX40.EC__.SBDW */
                            }
                        }

                        Release (SMTX)
                    }

                    Return (Local0)
                }

                Method (SBRB, 3, NotSerialized)
                {
                    Local0 = One
                    Local1 = Buffer (One)
                        {
                             0x00                                             // .
                        }
                    If (!Acquire (SMTX, 0xFFFF))
                    {
                        If ((SPTR == Zero))
                        {
                            SADR = (Arg0 << One)
                            SCMD = Arg1
                            SPTR = 0x0B
                            Local0 = SBPC (0x03E8)
                            If (!Local0)
                            {
                                Arg2 = SBFR /* \_SB_.PCI0.PX40.EC__.SBFR */
                            }
                        }

                        Release (SMTX)
                    }

                    Return (Local0)
                }
            }

            Method (_Q30, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If ((GOST == 0x07))
                {
                    Notify (SMB0, 0x80) // Status Change
                }
                ElseIf ((SSTS & 0x40))
                {
                    If (!Acquire (^SMB0.SMTX, 0xFFFF))
                    {
                        Local0 = (SAAD >> One)
                        If ((Local0 == 0x0A))
                        {
                            ^^^^BAT0.BNOT (SADW)
                        }

                        SSTS = Zero
                        Release (^SMB0.SMTX)
                    }
                }
            }
        }
    }

    Scope (_SB)
    {
        Device (ADP0)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((^^PCI0.BATC == Zero))
                {
                    Return (Zero)
                }

                Return (0x0F)
            }

            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                If ((^^PCI0.PX40.EC.ECOK == Zero))
                {
                    Return (One)
                }

                ^^PCI0.PX40.EC.SMB0.SBRW (0x0A, 0x02, RefOf (Local0))
                If ((Local0 & One))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
            {
                Return (_SB) /* \_SB_ */
            }
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (BSSW, 0xFFFF)
            Name (PBIF, Package (0x0D)
            {
                Zero, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                One, 
                0xFFFFFFFF, 
                0xFA, 
                0x64, 
                0x0A, 
                0x0A, 
                " ", 
                " ", 
                " ", 
                " "
            })
            Name (PBST, Package (0x04)
            {
                Zero, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
            {
                Return (_SB) /* \_SB_ */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((^^PCI0.BATC == Zero))
                {
                    Return (Zero)
                }

                If ((^^PCI0.GOST == 0x07))
                {
                    Return (Zero)
                }

                If (^^PCI0.PX40.EC.ECOK)
                {
                    UBSS ()
                    If ((BSSW & One))
                    {
                        Return (0x1F)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                If ((BSSW & One))
                {
                    UBST ()
                }
                Else
                {
                    PBST [Zero] = Zero
                    PBST [One] = 0xFFFFFFFF
                    PBST [0x02] = 0xFFFFFFFF
                }

                Return (PBST) /* \_SB_.BAT0.PBST */
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                If ((BSSW & One))
                {
                    UBIF ()
                }

                Return (PBIF) /* \_SB_.BAT0.PBIF */
            }

            Method (BNOT, 1, NotSerialized)
            {
                Local0 = BSSW /* \_SB_.BAT0.BSSW */
                BSSW = Arg0
                Notify (BAT0, 0x80) // Status Change
                If (((Local0 ^ Arg0) & One))
                {
                    Notify (BAT0, 0x81) // Information Change
                }
            }

            Method (UBSS, 0, NotSerialized)
            {
                ^^PCI0.PX40.EC.SMB0.SBRW (0x0A, One, RefOf (BSSW))
            }

            Method (UBIF, 0, NotSerialized)
            {
                ^^PCI0.PX40.EC.SMB0.SBRW (0x0B, 0x18, RefOf (Local0))
                PBIF [One] = (Local0 * 0x0A)
                ^^PCI0.PX40.EC.SMB0.SBRW (0x0B, 0x10, RefOf (Local0))
                PBIF [0x02] = (Local0 * 0x0A)
                ^^PCI0.PX40.EC.SMB0.SBRW (0x0B, 0x19, RefOf (Local0))
                PBIF [0x04] = Local0
                ^^PCI0.PX40.EC.SMB0.SBRB (0x0B, 0x21, RefOf (Local0))
                PBIF [0x09] = Local0
                PBIF [0x0A] = Buffer (One)
                    {
                         0x00                                             // .
                    }
                ^^PCI0.PX40.EC.SMB0.SBRB (0x0B, 0x22, RefOf (Local0))
                PBIF [0x0B] = Local0
                ^^PCI0.PX40.EC.SMB0.SBRB (0x0B, 0x20, RefOf (Local0))
                PBIF [0x0C] = Local0
            }

            Method (UBST, 0, NotSerialized)
            {
                ^^PCI0.PX40.EC.SMB0.SBRW (0x0B, 0x09, RefOf (Local2))
                PBST [0x03] = Local2
                ^^PCI0.PX40.EC.SMB0.SBRW (0x0B, 0x0A, RefOf (Local0))
                If ((Local0 & 0x8000))
                {
                    Local0 = ~Local0
                    Local0 = (Local0++ & 0xFFFF)
                }

                Local0 *= Local2
                PBST [One] = (Local0 / 0x03E8)
                ^^PCI0.PX40.EC.SMB0.SBRW (0x0B, 0x0F, RefOf (Local0))
                PBST [0x02] = (Local0 * 0x0A)
                Local1 = Zero
                If (^^ADP0._PSR ())
                {
                    ^^PCI0.PX40.EC.SMB0.SBRW (0x0B, 0x16, RefOf (Local0))
                    If (!(Local0 & 0x20))
                    {
                        Local1 = 0x02
                    }
                }
                Else
                {
                    Local1 = One
                }

                PBST [Zero] = Local1
            }
        }
    }

    Scope (_SB.PCI0.PX40)
    {
        Device (HPET)
        {
            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((HFLG & One))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        )
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {0}
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {8}
                })
            }
        }
    }

    Device (VGID)
    {
        Name (_HID, EisaId ("PRL0000"))  // _HID: Hardware ID
        Name (_UID, Zero)  // _UID: Unique ID
        Name (_CID, "VM_Gen_Counter")  // _CID: Compatible ID
        Name (_DDN, "VM_Gen_Counter")  // _DDN: DOS Device Name
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Local0 = ((\_SB.PCI0.GID0 == Zero) && (\_SB.PCI0.GID1 == Zero))
            Local1 = ((\_SB.PCI0.GID2 == Zero) && (\_SB.PCI0.GID3 == Zero))
            If ((Local0 && Local1))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }

        Method (ADDR, 0, NotSerialized)
        {
            Return (GID) /* \GID_ */
        }
    }

    Scope (_SB)
    {
        Scope (\_GPE)
        {
            Method (_L0E, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (VGID, 0x80) // Status Change
            }
        }
    }

    Scope (_GPE)
    {
        Method (_L0C, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Acquire (\_SB.PRM, 0xFFFF)
            DEBM = 0x0C
            Local0 = \_SB.PRS
            Local1 = \_SB.PRN
            Local2 = Zero
            DEBM = 0xBB
            Local6 = (Local0 | Local1)
            While ((Local6 >> Local2))
            {
                DEBM = Local2
                Local3 = (One << Local2)
                Local4 = (Local3 & Local0)
                Local5 = (Local3 & Local1)
                If ((Local4 != Local5))
                {
                    If ((Local5 == Zero))
                    {
                        \_SB.CPNT (Local2, 0x03)
                    }
                    Else
                    {
                        \_SB.CPNT (Local2, One)
                        Local0 ^= Local3
                    }
                }

                Local2++
            }

            \_SB.PRS = Local0
            Release (\_SB.PRM)
        }
    }

    Scope (_SB)
    {
        Mutex (MEMM, 0x01)
        Method (MBAS, 1, NotSerialized)
        {
            Local0 = ((Arg0 * 0x0C) + 0x0820)
            Return (Local0)
        }

        Method (MCRS, 1, Serialized)
        {
            Acquire (MEMM, 0xFFFF)
            OperationRegion (MREG, SystemIO, MBAS (Arg0), 0x10)
            Field (MREG, DWordAcc, NoLock, Preserve)
            {
                XSTA,   4, 
                XNEW,   1, 
                XASK,   11, 
                Offset (0x04), 
                XBAS,   32, 
                XEND,   32
            }

            Name (RSRC, Buffer (0x2E)
            {
                /* 0000 */  0x8A, 0x2B, 0x00, 0x00, 0x0C, 0x03, 0x00, 0x00,  // .+......
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF,  // ........
                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00               // ......
            })
            Name (ENDT, Buffer (0x02)
            {
                 0x79, 0x00                                       // y.
            })
            CreateDWordField (RSRC, 0x10, RMIN)
            CreateDWordField (RSRC, 0x18, RMAX)
            CreateDWordField (RSRC, 0x28, RLEN)
            Local0 = XBAS /* \_SB_.MCRS.XBAS */
            Local1 = XEND /* \_SB_.MCRS.XEND */
            Local3 = Zero
            While ((Local0 != Local1))
            {
                Local2 = (Local1 - Local0)
                If ((Local2 > 0xB000))
                {
                    Local2 = 0xB000
                }

                RMIN = Local0
                RLEN = Local2
                RMAX = ((Local0 + Local2) - One)
                Local0 += Local2
                If ((ObjectType (Local3) == 0x03))
                {
                    Local3 = Concatenate (Local3, RSRC)
                }
                Else
                {
                    Local3 = RSRC /* \_SB_.MCRS.RSRC */
                }
            }

            If ((ObjectType (Local3) == 0x03))
            {
                Local3 = Concatenate (Local3, ENDT)
            }
            Else
            {
                Local3 = ENDT /* \_SB_.MCRS.ENDT */
            }

            Release (MEMM)
            Return (Local3)
        }

        Method (MSNT, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Notify (^L0M0.MEM0, Arg1)
            }

            If ((Arg0 == One))
            {
                Notify (^L0M0.MEM1, Arg1)
            }

            If ((Arg0 == 0x02))
            {
                Notify (^L0M0.MEM2, Arg1)
            }

            If ((Arg0 == 0x03))
            {
                Notify (^L0M0.MEM3, Arg1)
            }

            If ((Arg0 == 0x04))
            {
                Notify (^L0M0.MEM4, Arg1)
            }

            If ((Arg0 == 0x05))
            {
                Notify (^L0M0.MEM5, Arg1)
            }

            If ((Arg0 == 0x06))
            {
                Notify (^L0M0.MEM6, Arg1)
            }

            If ((Arg0 == 0x07))
            {
                Notify (^L0M0.MEM7, Arg1)
            }

            If ((Arg0 == 0x08))
            {
                Notify (^L0M1.MEM0, Arg1)
            }

            If ((Arg0 == 0x09))
            {
                Notify (^L0M1.MEM1, Arg1)
            }

            If ((Arg0 == 0x0A))
            {
                Notify (^L0M1.MEM2, Arg1)
            }

            If ((Arg0 == 0x0B))
            {
                Notify (^L0M1.MEM3, Arg1)
            }

            If ((Arg0 == 0x0C))
            {
                Notify (^L0M1.MEM4, Arg1)
            }

            If ((Arg0 == 0x0D))
            {
                Notify (^L0M1.MEM5, Arg1)
            }

            If ((Arg0 == 0x0E))
            {
                Notify (^L0M1.MEM6, Arg1)
            }

            If ((Arg0 == 0x0F))
            {
                Notify (^L0M1.MEM7, Arg1)
            }

            If ((Arg0 == 0x10))
            {
                Notify (^L0M2.MEM0, Arg1)
            }

            If ((Arg0 == 0x11))
            {
                Notify (^L0M2.MEM1, Arg1)
            }

            If ((Arg0 == 0x12))
            {
                Notify (^L0M2.MEM2, Arg1)
            }

            If ((Arg0 == 0x13))
            {
                Notify (^L0M2.MEM3, Arg1)
            }

            If ((Arg0 == 0x14))
            {
                Notify (^L0M2.MEM4, Arg1)
            }

            If ((Arg0 == 0x15))
            {
                Notify (^L0M2.MEM5, Arg1)
            }

            If ((Arg0 == 0x16))
            {
                Notify (^L0M2.MEM6, Arg1)
            }

            If ((Arg0 == 0x17))
            {
                Notify (^L0M2.MEM7, Arg1)
            }

            If ((Arg0 == 0x18))
            {
                Notify (^L0M3.MEM0, Arg1)
            }

            If ((Arg0 == 0x19))
            {
                Notify (^L0M3.MEM1, Arg1)
            }

            If ((Arg0 == 0x1A))
            {
                Notify (^L0M3.MEM2, Arg1)
            }

            If ((Arg0 == 0x1B))
            {
                Notify (^L0M3.MEM3, Arg1)
            }

            If ((Arg0 == 0x1C))
            {
                Notify (^L0M3.MEM4, Arg1)
            }

            If ((Arg0 == 0x1D))
            {
                Notify (^L0M3.MEM5, Arg1)
            }

            If ((Arg0 == 0x1E))
            {
                Notify (^L0M3.MEM6, Arg1)
            }

            If ((Arg0 == 0x1F))
            {
                Notify (^L0M3.MEM7, Arg1)
            }
        }

        Method (MGNT, 1, Serialized, 1)
        {
            OperationRegion (MREG, SystemIO, MBAS (Arg0), 0x10)
            Field (MREG, ByteAcc, NoLock, Preserve)
            {
                XSTA,   4, 
                XNEW,   1
            }

            Local0 = XNEW /* \_SB_.MGNT.XNEW */
            If ((Local0 == One))
            {
                XNEW = Zero
            }

            Return (Local0)
        }

        Method (MENT, 0, NotSerialized)
        {
            Acquire (MEMM, 0xFFFF)
            Local0 = Zero
            While ((Local0 < 0x20))
            {
                If ((MGNT (Local0) == One))
                {
                    MSNT (Local0, One)
                }

                Local0++
            }

            Release (MEMM)
        }

        Method (MSTA, 1, Serialized)
        {
            Acquire (MEMM, 0xFFFF)
            OperationRegion (MREG, SystemIO, MBAS (Arg0), 0x10)
            Field (MREG, ByteAcc, NoLock, Preserve)
            {
                XSTA,   4
            }

            Local0 = XSTA /* \_SB_.MSTA.XSTA */
            Release (MEMM)
            Return (Local0)
        }

        Method (MOST, 4, Serialized)
        {
            Acquire (MEMM, 0xFFFF)
            OperationRegion (MREG, SystemIO, MBAS (Arg0), 0x10)
            Field (MREG, ByteAcc, NoLock, Preserve)
            {
                XSTA,   4, 
                XNEW,   1, 
                XASK,   11
            }

            XASK = (Arg2 | 0x0400)
            Release (MEMM)
        }

        Device (L0M0)
        {
            Name (_HID, EisaId ("PNP0A05") /* Generic Container Device */)  // _HID: Hardware ID
            Name (_UID, 0x10)  // _UID: Unique ID
            Device (MEM0)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM1)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM2)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM3)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM4)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM5)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM6)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM7)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }
        }

        Device (L0M1)
        {
            Name (_HID, EisaId ("PNP0A05") /* Generic Container Device */)  // _HID: Hardware ID
            Name (_UID, 0x20)  // _UID: Unique ID
            Device (MEM0)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM1)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x09)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM2)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM3)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x0B)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM4)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x0C)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM5)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x0D)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM6)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x0E)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM7)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x0F)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }
        }

        Device (L0M2)
        {
            Name (_HID, EisaId ("PNP0A05") /* Generic Container Device */)  // _HID: Hardware ID
            Name (_UID, 0x30)  // _UID: Unique ID
            Device (MEM0)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x10)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM1)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x11)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM2)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x12)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM3)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x13)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM4)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x14)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM5)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x15)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM6)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x16)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM7)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x17)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }
        }

        Device (L0M3)
        {
            Name (_HID, EisaId ("PNP0A05") /* Generic Container Device */)  // _HID: Hardware ID
            Name (_UID, 0x40)  // _UID: Unique ID
            Device (MEM0)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x18)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM1)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x19)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM2)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x1A)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM3)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x1B)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM4)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x1C)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM5)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x1D)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM6)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x1E)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }

            Device (MEM7)
            {
                Name (_HID, EisaId ("PNP0C80") /* Memory Device */)  // _HID: Hardware ID
                Name (_UID, 0x1F)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (MCRS (_UID))
                }

                Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
                {
                    MOST (_UID, Arg0, Arg1, Arg2)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (MSTA (_UID))
                }
            }
        }
    }

    Scope (_GPE)
    {
        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            \_SB.MENT ()
        }
    }

    Scope (_SB.PCI0)
    {
        OperationRegion (MBOX, SystemMemory, 0x000F0000, 0x5C)
        Field (MBOX, DWordAcc, NoLock, Preserve)
        {
            MVER,   32, 
            HFLG,   32, 
            SRL1,   32, 
            SRL2,   32, 
            SRL3,   32, 
            SRL4,   32, 
            PRL1,   32, 
            PRL2,   32, 
            PRL3,   32, 
            GOST,   32, 
            GOSN,   32, 
            BATC,   32, 
            BFLG,   32, 
            FDCP,   32, 
            LFRE,   32, 
            S4SP,   32, 
            GID0,   32, 
            GID1,   32, 
            GID2,   32, 
            GID3,   32, 
            S3SP,   32, 
            ENEM,   32, 
            INVF,   32
        }
    }

    Scope (\)
    {
        Name (GID, Package (0x02)
        {
            0x000F0040, 
            Zero
        })
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If ((\_SB.PCI0.S3SP != Zero))
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            0x05, 
            Zero, 
            Zero
        })
    }

    If ((\_SB.PCI0.S4SP != Zero))
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x06, 
            0x06, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        0x07, 
        Zero, 
        Zero
    })
    OperationRegion (HYPV, SystemIO, 0x2D, One)
    Field (HYPV, ByteAcc, NoLock, Preserve)
    {
        HVPT,   8
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        PBST = One
        While (PBST)
        {
            PBST = One
        }

        If ((Arg0 == One))
        {
            HVPT = 0x51
            Noop
        }
        ElseIf ((Arg0 == 0x02))
        {
            HVPT = 0x52
            Noop
        }
        ElseIf ((Arg0 == 0x03))
        {
            HVPT = 0x53
            Noop
        }
        ElseIf ((Arg0 == 0x04))
        {
            HVPT = 0x54
            Noop
        }
        Else
        {
            HVPT = 0x55
            Noop
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If ((Arg0 == One))
        {
            HVPT = 0xE1
            Return (Zero)
        }
        ElseIf ((Arg0 == 0x02))
        {
            HVPT = 0xE2
            Return (Zero)
        }
        ElseIf ((Arg0 == 0x03))
        {
            HVPT = 0xE3
            Return (Zero)
        }
        ElseIf ((Arg0 == 0x04))
        {
            HVPT = 0xE4
            Return (Zero)
        }
        Else
        {
            HVPT = 0xE5
            Return (Zero)
        }
    }

    Scope (_SB.PCI0)
    {
        Device (NET0)
        {
            Name (_ADR, 0x00050000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & One))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NET1)
        {
            Name (_ADR, 0x00060000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x02))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NET2)
        {
            Name (_ADR, 0x00070000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x04))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NET3)
        {
            Name (_ADR, 0x00080000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x08))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NET4)
        {
            Name (_ADR, 0x00090000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x10))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.PCI2)
    {
        Device (NET5)
        {
            Name (_ADR, 0x00010000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x20))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NET6)
        {
            Name (_ADR, 0x00020000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x40))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NET7)
        {
            Name (_ADR, 0x00030000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x80))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NET8)
        {
            Name (_ADR, 0x00040000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x0100))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NET9)
        {
            Name (_ADR, 0x00050000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x0200))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NETA)
        {
            Name (_ADR, 0x00060000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x0400))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NETB)
        {
            Name (_ADR, 0x00070000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x0800))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NETC)
        {
            Name (_ADR, 0x00080000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x1000))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NETD)
        {
            Name (_ADR, 0x00090000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x2000))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NETE)
        {
            Name (_ADR, 0x000A0000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x4000))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (NETF)
        {
            Name (_ADR, 0x000B0000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((ENEM & 0x8000))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }
}


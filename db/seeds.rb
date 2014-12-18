# Encoding: UTF-8

#====================================================================
# SEED ROLES
admin = Role::create label: 'Administrator'
draft = Role::create label: 'Draftsman'
commi = Role::create label: 'Commissioner'

#====================================================================
# SEED USERS
User::create email: 'fabioalmeida@ibtecnologia.com.br',
  password: '1',
  password_confirmation: '1',
  name: "Fábio Moritz de Almeida",
  ctps: "3696451-002/PR",
  ci: "11.099.671-3",
  cpf: "080.708.869-27",
  pis: "131.42996.53.1",
  reg: "423",
  role_id: admin.id

User::create name: "David Rocha Milsted",
  password: '1',
  password_confirmation: '1',
  email: "davidmilsted@ibtecnologia.com.br",
  ctps: "3705156-002/PR",
  ci: "80651872-SESP/PR",
  cpf: "070.538.689-90",
  pis: "200.34971-80.1",
  reg: "609",
  role_id: admin.id

User::create name: 'Projetista 01',
  password: '1',
  password_confirmation: '1',
  email: 'proj01@ibtecnologia.com.br',
  role_id: draft.id

User::create name: 'Projetista 02',
  password: '1',
  password_confirmation: '1',
  email: 'proj02@ibtecnologia.com.br',
  role_id: draft.id

User::create name: 'Comissionador 01',
  password: '1',
  password_confirmation: '1',
  email: 'com01@ibtecnologia.com.br',
  role_id: commi.id

User::create name: 'Comissionador 02',
  password: '1',
  password_confirmation: '1',
  email: 'com02@ibtecnologia.com.br',
  role_id: commi.id

#====================================================================
# SEED MANUFACTURERS
lenel = Manufacturer::create label: 'Lenel',
  homepage: 'http://www.lenel.com/'
tyco  = Manufacturer::create label: 'Tyco',
  homepage: 'http://www.tyco.com/'
delta_controls = Manufacturer::create label: 'Delta Controls',
  homepage: 'http://www.deltacontrols.com/'
delta_electronics = Manufacturer::create label: 'Delta Electronics',
  homepage: 'http://www.deltaww.com/'
microsoft = Manufacturer::create label: 'Microsoft',
  homepage: 'http://www.microsoft.com/'
canonical = Manufacturer::create label: 'Canonical',
  homepage: 'http://www.canonical.com/'

#====================================================================
# SEED PRODUCT TYPES
ac = ProductType::create label: 'Controle de Acesso',
  description: 'Sistemas de controle e monitoramento de acesso.'
cftv = ProductType::create label: 'CFTV',
  description: 'Sistemas de monitoramento e gravação de vídeo.'
automation = ProductType::create label: 'Automação Predial',
  description: 'Sistemas de controle, automatização e supervisão predial.'
os = ProductType::create label: 'Sistema Operacional',
  description: 'Programa ou um conjunto de programas cuja função é gerenciar os recursos do sistema, fornecendo uma interface entre o computador e o usuário.'

#====================================================================
# SEED PRODUCTS
Product::create label: 'OnGuard',
  description: 'Solução de controle de acesso.',
  manufacturer_id: lenel.id
  #product_type: ac

Product::create label: 'LNVR',
  description: 'Solução em CFTV, exige OnGuard para ser configurado.',
  manufacturer_id: tyco.id
  #product_type: os

Product::create label: 'VideoEdge',
  description: 'Solução de CFTV.',
  manufacturer_id: tyco.id
  #product_type: cftv

Product::create label: 'OrcaView',
  description: 'Solução de supervisório para sistemas de automação predial.',
  manufacturer_id: delta_controls.id
  #product_type: automation

#====================================================================
# SEED PLATFORMS
Platform::create label: 'Windows 2008 Server R2',
  description: 'Windows Server 2008 R2 is a server operating system produced by Microsoft. It was released to manufacturing (RTM) on July 22, 2009 and launched on October 22, 2009. According to the Windows Server Team blog, the retail availability was September 14, 2009. It is built on Windows NT 6.1, the same kernel used with the client-oriented Windows 7. It is the first 64-bit-only operating system released from Microsoft. Version enhancements include new functionality for Active Directory, new virtualization and management features, version 7.5 of Microsoft IIS Web Server and support for up to 256 logical processors.
  There are seven editions: Foundation, Standard, Enterprise, Datacenter, Web, HPC Server, Itanium and Windows Storage Server 2008 R2 (Essentials Edition).',
  manufacturer_id: microsoft.id
  #product_type: os

Platform::create label: 'Ubuntu Server 10.14 x64',
  description: 'Debian-based Linux operating system.',
  manufacturer_id: canonical.id
  #product_type: os

#====================================================================
# SEED CLIENTS
[ 'San Remo', 'Normandia', 'Hugo Peretti', 'Banco Daycoval',
  'GVT', 'Nissan', 'Centro Israelita Paranaense' ].each do |l|
  Client::create label: l
end

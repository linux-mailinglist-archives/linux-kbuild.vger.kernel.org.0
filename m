Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE71620A734
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 23:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405592AbgFYVGZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jun 2020 17:06:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:48928 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405347AbgFYVGZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 17:06:25 -0400
IronPort-SDR: 3E0AL0qPFIEguLSn3Ni8nO04aFvA5QDz2a6XB7hGHQ9NCTtkWqFgiv1nLglVw2VpDu0/abi1pU
 PVVAyuJ1eCDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="146576047"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; 
   d="gz'50?scan'50,208,50";a="146576047"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2020 14:06:21 -0700
IronPort-SDR: szIIETlDHUMttvhH7Vu1p6DK28LR4xy4H+u3YiBxBSvsekPCULKZz4Z5JZ1gZyjQVO0uJrA3Do
 JHsOHUo5W8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; 
   d="gz'50?scan'50,208,50";a="479778186"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jun 2020 14:06:19 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1joZ4c-0001oH-Eh; Thu, 25 Jun 2020 21:06:18 +0000
Date:   Fri, 26 Jun 2020 05:05:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [kbuild:lto 11/22] arch/x86/kernel/quirks.c:418:1: warning: no
 previous prototype for function '__UNIQUE_ID_ati_force_enable_hpet228'
Message-ID: <202006260535.Ku2WuRat%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git lto
head:   da374a5330c824401ab9ba8c91578509192d876a
commit: 6edf35469fb63b6ab3d6b9c45a0734c737a22dbf [11/22] pci: lto: fix PREL32 relocations
config: x86_64-allnoconfig (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 8911a35180c6777188fefe0954a2451a2b91deaf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git checkout 6edf35469fb63b6ab3d6b9c45a0734c737a22dbf
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:54:1: note: expanded from here
   __UNIQUE_ID_vt8237_force_enable_hpet225
   ^
   arch/x86/kernel/quirks.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8235,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
   arch/x86/kernel/quirks.c:345:1: warning: no previous prototype for function '__UNIQUE_ID_vt8237_force_enable_hpet226' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8237,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:63:1: note: expanded from here
   __UNIQUE_ID_vt8237_force_enable_hpet226
   ^
   arch/x86/kernel/quirks.c:345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8237,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
   arch/x86/kernel/quirks.c:347:1: warning: no previous prototype for function '__UNIQUE_ID_vt8237_force_enable_hpet227' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_CX700,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:72:1: note: expanded from here
   __UNIQUE_ID_vt8237_force_enable_hpet227
   ^
   arch/x86/kernel/quirks.c:347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_CX700,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
>> arch/x86/kernel/quirks.c:418:1: warning: no previous prototype for function '__UNIQUE_ID_ati_force_enable_hpet228' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_IXP400_SMBUS,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:81:1: note: expanded from here
   __UNIQUE_ID_ati_force_enable_hpet228
   ^
   arch/x86/kernel/quirks.c:418:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_IXP400_SMBUS,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
   arch/x86/kernel/quirks.c:452:1: warning: no previous prototype for function '__UNIQUE_ID_nvidia_force_enable_hpet229' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0050,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:90:1: note: expanded from here
   __UNIQUE_ID_nvidia_force_enable_hpet229
   ^
   arch/x86/kernel/quirks.c:452:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0050,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
   arch/x86/kernel/quirks.c:454:1: warning: no previous prototype for function '__UNIQUE_ID_nvidia_force_enable_hpet230' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0051,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:99:1: note: expanded from here
   __UNIQUE_ID_nvidia_force_enable_hpet230
   ^
   arch/x86/kernel/quirks.c:454:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0051,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
--
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:162:1: note: expanded from here
   __UNIQUE_ID_nvidia_force_enable_hpet237
   ^
   arch/x86/kernel/quirks.c:470:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0365,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
   arch/x86/kernel/quirks.c:472:1: warning: no previous prototype for function '__UNIQUE_ID_nvidia_force_enable_hpet238' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0366,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:171:1: note: expanded from here
   __UNIQUE_ID_nvidia_force_enable_hpet238
   ^
   arch/x86/kernel/quirks.c:472:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0366,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
   arch/x86/kernel/quirks.c:474:1: warning: no previous prototype for function '__UNIQUE_ID_nvidia_force_enable_hpet239' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0367,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:180:1: note: expanded from here
   __UNIQUE_ID_nvidia_force_enable_hpet239
   ^
   arch/x86/kernel/quirks.c:474:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0367,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
>> arch/x86/kernel/quirks.c:514:1: warning: no previous prototype for function '__UNIQUE_ID_e6xx_force_enable_hpet240' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_E6XX_CU,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:189:1: note: expanded from here
   __UNIQUE_ID_e6xx_force_enable_hpet240
   ^
   arch/x86/kernel/quirks.c:514:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_E6XX_CU,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
>> arch/x86/kernel/quirks.c:529:1: warning: no previous prototype for function '__UNIQUE_ID_force_disable_hpet_msi241' [-Wmissing-prototypes]
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_SBX00_SMBUS,
   ^
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1929:26: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
                                     class_shift, hook, __UNIQUE_ID(hook))
                                                        ^
   include/linux/compiler-clang.h:13:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:54:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:53:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:198:1: note: expanded from here
   __UNIQUE_ID_force_disable_hpet_msi241
   ^
   arch/x86/kernel/quirks.c:529:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_SBX00_SMBUS,
   ^
   static 
   include/linux/pci.h:1976:2: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
           DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,                    \
           ^
   include/linux/pci.h:1928:2: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
           __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,   \
           ^
   include/linux/pci.h:1924:2: note: expanded from macro '__DECLARE_PCI_FIXUP_SECTION'
           ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,  \
           ^
   include/linux/pci.h:1914:2: note: expanded from macro '___DECLARE_PCI_FIXUP_SECTION'
           void stub(struct pci_dev *dev) { hook(dev); }                   \
           ^
   34 warnings generated.

vim +/__UNIQUE_ID_ati_force_enable_hpet228 +418 arch/x86/kernel/quirks.c

e7250b8ae3870f Andreas Herrmann     2008-09-05  376  
e8aa4667baf74d Andreas Herrmann     2008-05-09  377  static void ati_force_enable_hpet(struct pci_dev *dev)
e8aa4667baf74d Andreas Herrmann     2008-05-09  378  {
e7250b8ae3870f Andreas Herrmann     2008-09-05  379  	u32 d, val;
e7250b8ae3870f Andreas Herrmann     2008-09-05  380  	u8  b;
e8aa4667baf74d Andreas Herrmann     2008-05-09  381  
7c4728f4a86506 Thomas Gleixner      2008-05-10  382  	if (hpet_address || force_hpet_address)
7c4728f4a86506 Thomas Gleixner      2008-05-10  383  		return;
7c4728f4a86506 Thomas Gleixner      2008-05-10  384  
7c4728f4a86506 Thomas Gleixner      2008-05-10  385  	if (!hpet_force_user) {
7c4728f4a86506 Thomas Gleixner      2008-05-10  386  		hpet_print_force_info();
e8aa4667baf74d Andreas Herrmann     2008-05-09  387  		return;
7c4728f4a86506 Thomas Gleixner      2008-05-10  388  	}
e8aa4667baf74d Andreas Herrmann     2008-05-09  389  
e7250b8ae3870f Andreas Herrmann     2008-09-05  390  	d = ati_ixp4x0_rev(dev);
e7250b8ae3870f Andreas Herrmann     2008-09-05  391  	if (d  < 0x82)
e7250b8ae3870f Andreas Herrmann     2008-09-05  392  		return;
e7250b8ae3870f Andreas Herrmann     2008-09-05  393  
e7250b8ae3870f Andreas Herrmann     2008-09-05  394  	/* base address */
e8aa4667baf74d Andreas Herrmann     2008-05-09  395  	pci_write_config_dword(dev, 0x14, 0xfed00000);
e8aa4667baf74d Andreas Herrmann     2008-05-09  396  	pci_read_config_dword(dev, 0x14, &val);
e7250b8ae3870f Andreas Herrmann     2008-09-05  397  
e7250b8ae3870f Andreas Herrmann     2008-09-05  398  	/* enable interrupt */
e7250b8ae3870f Andreas Herrmann     2008-09-05  399  	outb(0x72, 0xcd6); b = inb(0xcd7);
e7250b8ae3870f Andreas Herrmann     2008-09-05  400  	b |= 0x1;
e7250b8ae3870f Andreas Herrmann     2008-09-05  401  	outb(0x72, 0xcd6); outb(b, 0xcd7);
e7250b8ae3870f Andreas Herrmann     2008-09-05  402  	outb(0x72, 0xcd6); b = inb(0xcd7);
e7250b8ae3870f Andreas Herrmann     2008-09-05  403  	if (!(b & 0x1))
e7250b8ae3870f Andreas Herrmann     2008-09-05  404  		return;
e7250b8ae3870f Andreas Herrmann     2008-09-05  405  	pci_read_config_dword(dev, 0x64, &d);
e7250b8ae3870f Andreas Herrmann     2008-09-05  406  	d |= (1<<10);
e7250b8ae3870f Andreas Herrmann     2008-09-05  407  	pci_write_config_dword(dev, 0x64, d);
e7250b8ae3870f Andreas Herrmann     2008-09-05  408  	pci_read_config_dword(dev, 0x64, &d);
e7250b8ae3870f Andreas Herrmann     2008-09-05  409  	if (!(d & (1<<10)))
e7250b8ae3870f Andreas Herrmann     2008-09-05  410  		return;
e7250b8ae3870f Andreas Herrmann     2008-09-05  411  
e8aa4667baf74d Andreas Herrmann     2008-05-09  412  	force_hpet_address = val;
e8aa4667baf74d Andreas Herrmann     2008-05-09  413  	force_hpet_resume_type = ATI_FORCE_HPET_RESUME;
e8aa4667baf74d Andreas Herrmann     2008-05-09  414  	dev_printk(KERN_DEBUG, &dev->dev, "Force enabled HPET at 0x%lx\n",
e8aa4667baf74d Andreas Herrmann     2008-05-09  415  		   force_hpet_address);
e8aa4667baf74d Andreas Herrmann     2008-05-09  416  	cached_dev = dev;
e8aa4667baf74d Andreas Herrmann     2008-05-09  417  }
e8aa4667baf74d Andreas Herrmann     2008-05-09 @418  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_IXP400_SMBUS,
e8aa4667baf74d Andreas Herrmann     2008-05-09  419  			 ati_force_enable_hpet);
e8aa4667baf74d Andreas Herrmann     2008-05-09  420  
d79a5f80dc1153 Carlos Corbacho      2007-10-19  421  /*
d79a5f80dc1153 Carlos Corbacho      2007-10-19  422   * Undocumented chipset feature taken from LinuxBIOS.
d79a5f80dc1153 Carlos Corbacho      2007-10-19  423   */
d79a5f80dc1153 Carlos Corbacho      2007-10-19  424  static void nvidia_force_hpet_resume(void)
d79a5f80dc1153 Carlos Corbacho      2007-10-19  425  {
d79a5f80dc1153 Carlos Corbacho      2007-10-19  426  	pci_write_config_dword(cached_dev, 0x44, 0xfed00001);
d79a5f80dc1153 Carlos Corbacho      2007-10-19  427  	printk(KERN_DEBUG "Force enabled HPET at resume\n");
d79a5f80dc1153 Carlos Corbacho      2007-10-19  428  }
d79a5f80dc1153 Carlos Corbacho      2007-10-19  429  
d79a5f80dc1153 Carlos Corbacho      2007-10-19  430  static void nvidia_force_enable_hpet(struct pci_dev *dev)
d79a5f80dc1153 Carlos Corbacho      2007-10-19  431  {
d79a5f80dc1153 Carlos Corbacho      2007-10-19  432  	u32 uninitialized_var(val);
d79a5f80dc1153 Carlos Corbacho      2007-10-19  433  
7c4728f4a86506 Thomas Gleixner      2008-05-10  434  	if (hpet_address || force_hpet_address)
7c4728f4a86506 Thomas Gleixner      2008-05-10  435  		return;
7c4728f4a86506 Thomas Gleixner      2008-05-10  436  
7c4728f4a86506 Thomas Gleixner      2008-05-10  437  	if (!hpet_force_user) {
7c4728f4a86506 Thomas Gleixner      2008-05-10  438  		hpet_print_force_info();
d79a5f80dc1153 Carlos Corbacho      2007-10-19  439  		return;
7c4728f4a86506 Thomas Gleixner      2008-05-10  440  	}
d79a5f80dc1153 Carlos Corbacho      2007-10-19  441  
d79a5f80dc1153 Carlos Corbacho      2007-10-19  442  	pci_write_config_dword(dev, 0x44, 0xfed00001);
d79a5f80dc1153 Carlos Corbacho      2007-10-19  443  	pci_read_config_dword(dev, 0x44, &val);
d79a5f80dc1153 Carlos Corbacho      2007-10-19  444  	force_hpet_address = val & 0xfffffffe;
d79a5f80dc1153 Carlos Corbacho      2007-10-19  445  	force_hpet_resume_type = NVIDIA_FORCE_HPET_RESUME;
9ed885541bc57a bjorn.helgaas@hp.com 2007-12-17  446  	dev_printk(KERN_DEBUG, &dev->dev, "Force enabled HPET at 0x%lx\n",
d79a5f80dc1153 Carlos Corbacho      2007-10-19  447  		force_hpet_address);
d79a5f80dc1153 Carlos Corbacho      2007-10-19  448  	cached_dev = dev;
d79a5f80dc1153 Carlos Corbacho      2007-10-19  449  }
d79a5f80dc1153 Carlos Corbacho      2007-10-19  450  
d79a5f80dc1153 Carlos Corbacho      2007-10-19  451  /* ISA Bridges */
d79a5f80dc1153 Carlos Corbacho      2007-10-19  452  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0050,
d79a5f80dc1153 Carlos Corbacho      2007-10-19  453  			nvidia_force_enable_hpet);
d79a5f80dc1153 Carlos Corbacho      2007-10-19  454  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0051,
d79a5f80dc1153 Carlos Corbacho      2007-10-19  455  			nvidia_force_enable_hpet);
b196884e2f5d45 Udo A. Steinberg     2007-10-19  456  
1b82ba6e47c13e Carlos Corbacho      2007-10-19  457  /* LPC bridges */
96bcf458cbc71f Zbigniew Luszpinski  2008-03-19  458  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0260,
96bcf458cbc71f Zbigniew Luszpinski  2008-03-19  459  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  460  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0360,
1b82ba6e47c13e Carlos Corbacho      2007-10-19  461  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  462  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0361,
1b82ba6e47c13e Carlos Corbacho      2007-10-19  463  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  464  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0362,
1b82ba6e47c13e Carlos Corbacho      2007-10-19  465  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  466  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0363,
1b82ba6e47c13e Carlos Corbacho      2007-10-19  467  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  468  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0364,
1b82ba6e47c13e Carlos Corbacho      2007-10-19  469  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  470  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0365,
1b82ba6e47c13e Carlos Corbacho      2007-10-19  471  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  472  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0366,
1b82ba6e47c13e Carlos Corbacho      2007-10-19  473  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  474  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x0367,
1b82ba6e47c13e Carlos Corbacho      2007-10-19  475  			nvidia_force_enable_hpet);
1b82ba6e47c13e Carlos Corbacho      2007-10-19  476  
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  477  void force_hpet_resume(void)
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  478  {
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  479  	switch (force_hpet_resume_type) {
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  480  	case ICH_FORCE_HPET_RESUME:
4a5a77d106d6b4 Harvey Harrison      2008-02-06  481  		ich_force_hpet_resume();
4a5a77d106d6b4 Harvey Harrison      2008-02-06  482  		return;
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  483  	case OLD_ICH_FORCE_HPET_RESUME:
4a5a77d106d6b4 Harvey Harrison      2008-02-06  484  		old_ich_force_hpet_resume();
4a5a77d106d6b4 Harvey Harrison      2008-02-06  485  		return;
b196884e2f5d45 Udo A. Steinberg     2007-10-19  486  	case VT8237_FORCE_HPET_RESUME:
4a5a77d106d6b4 Harvey Harrison      2008-02-06  487  		vt8237_force_hpet_resume();
4a5a77d106d6b4 Harvey Harrison      2008-02-06  488  		return;
d79a5f80dc1153 Carlos Corbacho      2007-10-19  489  	case NVIDIA_FORCE_HPET_RESUME:
4a5a77d106d6b4 Harvey Harrison      2008-02-06  490  		nvidia_force_hpet_resume();
4a5a77d106d6b4 Harvey Harrison      2008-02-06  491  		return;
e8aa4667baf74d Andreas Herrmann     2008-05-09  492  	case ATI_FORCE_HPET_RESUME:
e8aa4667baf74d Andreas Herrmann     2008-05-09  493  		ati_force_hpet_resume();
e8aa4667baf74d Andreas Herrmann     2008-05-09  494  		return;
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  495  	default:
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  496  		break;
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  497  	}
bfe0c1cc6456bb Venki Pallipadi      2007-10-12  498  }
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  499  
2e151c70dfb007 Peter Neubauer       2014-09-12  500  /*
2e151c70dfb007 Peter Neubauer       2014-09-12  501   * According to the datasheet e6xx systems have the HPET hardwired to
2e151c70dfb007 Peter Neubauer       2014-09-12  502   * 0xfed00000
2e151c70dfb007 Peter Neubauer       2014-09-12  503   */
2e151c70dfb007 Peter Neubauer       2014-09-12  504  static void e6xx_force_enable_hpet(struct pci_dev *dev)
2e151c70dfb007 Peter Neubauer       2014-09-12  505  {
2e151c70dfb007 Peter Neubauer       2014-09-12  506  	if (hpet_address || force_hpet_address)
2e151c70dfb007 Peter Neubauer       2014-09-12  507  		return;
2e151c70dfb007 Peter Neubauer       2014-09-12  508  
2e151c70dfb007 Peter Neubauer       2014-09-12  509  	force_hpet_address = 0xFED00000;
2e151c70dfb007 Peter Neubauer       2014-09-12  510  	force_hpet_resume_type = NONE_FORCE_HPET_RESUME;
2e151c70dfb007 Peter Neubauer       2014-09-12  511  	dev_printk(KERN_DEBUG, &dev->dev, "Force enabled HPET at "
2e151c70dfb007 Peter Neubauer       2014-09-12  512  		"0x%lx\n", force_hpet_address);
2e151c70dfb007 Peter Neubauer       2014-09-12  513  }
2e151c70dfb007 Peter Neubauer       2014-09-12 @514  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_E6XX_CU,
2e151c70dfb007 Peter Neubauer       2014-09-12  515  			 e6xx_force_enable_hpet);
2e151c70dfb007 Peter Neubauer       2014-09-12  516  
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  517  /*
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  518   * HPET MSI on some boards (ATI SB700/SB800) has side effect on
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  519   * floppy DMA. Disable HPET MSI on such platforms.
fec84e330719c2 Andreas Herrmann     2010-05-17  520   * See erratum #27 (Misinterpreted MSI Requests May Result in
fec84e330719c2 Andreas Herrmann     2010-05-17  521   * Corrupted LPC DMA Data) in AMD Publication #46837,
fec84e330719c2 Andreas Herrmann     2010-05-17  522   * "SB700 Family Product Errata", Rev. 1.0, March 2010.
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  523   */
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  524  static void force_disable_hpet_msi(struct pci_dev *unused)
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  525  {
3d45ac4b35cbdf Jan Beulich          2015-10-19  526  	hpet_msi_disable = true;
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  527  }
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  528  
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21 @529  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_SBX00_SMBUS,
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  530  			 force_disable_hpet_msi);
73472a46b5b281 Pallipadi, Venkatesh 2010-01-21  531  

:::::: The code at line 418 was first introduced by commit
:::::: e8aa4667baf74dfd85fbaab86861465acb811085 x86: enable hpet=force for AMD SB400

:::::: TO: Andreas Herrmann <andreas.herrmann3@amd.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--7AUc2qLy4jB3hD7Z
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICG4M9V4AAy5jb25maWcAlFxZk9u2k3/Pp2AlVVvJg+25M96teYBIUETEywSoY15YioYz
1kYjzV/SOPa3326QFEGyoWRTlcRmNw4Cffz6oH756ReHvR93r8vjerXcbH44L+W23C+P5ZPz
vN6U/+N4iRMnyuGeUB+BOVxv379/+n5/V9zdOLcf7z9efNivrpxJud+WG8fdbZ/XL+8wfr3b
/vTLT24S+2JcuG4x5ZkUSVwoPlcPP682y+2L863cH4DPubz8ePHxwvn1ZX3870+f4L+v6/1+
t/+02Xx7Ld72u/8tV0fn/vPl5fL69vL+YnX3+++/X97fP5fP5cXn25vl1c3t5fLqz8+XT+Xy
+befm1XH7bIPF83D0Bs+Az4hCzdk8fjhh8EID8PQax9pjtPwy8sL+MeYw2VxEYp4YgxoHxZS
MSXcDi1gsmAyKsaJSqyEIslVmiuSLmKYmrckkX0pZklm7GCUi9BTIuKFYqOQFzLJjKlUkHEG
7xn7CfwHWCQOhXv7xRlrMdg4h/L4/tbe5ChLJjwu4CJllBoLx0IVPJ4WLIOTE5FQD9dXMEuz
5SRKBayuuFTO+uBsd0ec+HTUicvC5lh//rkdZxIKlquEGKzfsJAsVDi0fhiwKS8mPIt5WIwf
hbFTkzICyhVNCh8jRlPmj7YRiY1w0xK6ezq9qLkh8x37DLitc/T54/nRyXnyDXG+HvdZHip9
xcYJN4+DRKqYRfzh51+3u235m3F7ciGnInXJJWdMuUHxJec5J+lulkhZRDxKskXBlGJuQPLl
kodiRGxb3wDLYBGWg+mCvYAohY10g6I4h/c/Dz8Ox/K1le4xj3kmXK1HaZaMDNUySTJIZuZd
Zx48lYWcFRmXPPa6CuklERMx9awIBM9wjwt6nYipTMwL2DfogUoymgvXzKZgXEBHosTrmQM/
yVzu1ZouTAMnU5ZJjkxaEsvtk7N77p1Ma/kSdyKTHOaqrs5LjJn0MZssWlZ+UIOnLBQeU7wI
mVSFu3BD4oy1vZq2V9Yj6/n4lMdKniWisWKeCwudZ4vgJpj3R07yRYks8hS33MiOWr+C36LE
J3gsUhiVeNrOn2Q0TpAivJAWdU0mKYEYB3i9+kAy2eWp72uwm2YzacZ5lCqYXnuI06TN82kS
5rFi2YJcuuYyafrl3TT/pJaHv5wjrOssYQ+H4/J4cJar1e59e1xvX9rjAHc3KWBAwVw3gbUq
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
U3RuYLbV/gOlyng1EGwAAA==

--7AUc2qLy4jB3hD7Z--

Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292FF216E3A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 16:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgGGOBH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 10:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgGGOBG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 10:01:06 -0400
X-Greylist: delayed 703 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Jul 2020 07:01:05 PDT
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFF6C08C5E1
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2020 07:01:05 -0700 (PDT)
Received: from miraculix.mork.no (miraculix.mork.no [IPv6:2001:4641:0:2:7627:374e:db74:e353])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 067DnKe0025659
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
        for <linux-kbuild@vger.kernel.org>; Tue, 7 Jul 2020 15:49:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1594129760; bh=0UueTFg80QJXAo70usLTBxJrvWRLf/V/iWxJ2sCTTaQ=;
        h=From:To:Subject:Date:Message-ID:From;
        b=TmkQjPXZhhnphSXhi76AOfGZ/WUgTgo7SzgmGQ0awA53RycTgZtAVRZ5Su+rKmcku
         E3Pd5/t266WGJ0SixFcFPG0QVi92LM3QTcqHZkPDWX35BjCR3bqFzJ2Hk9UvDj8RyA
         TEm8Ku96JIAua1ZjDchRcYvrJdWKBe0tMKKPTHHo=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@mork.no>)
        id 1jsnyJ-000T4C-JK
        for linux-kbuild@vger.kernel.org; Tue, 07 Jul 2020 15:49:19 +0200
From:   =?utf-8?Q?Bj=C3=B8rn?= Mork <bjorn@mork.no>
To:     linux-kbuild@vger.kernel.org
Subject: Kbuild support for rebuilding a single driver gone?
Organization: m
Date:   Tue, 07 Jul 2020 15:49:19 +0200
Message-ID: <87lfjvbfkw.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.2 at canardo
X-Virus-Status: Clean
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ previously posted to kernelnewbies ]

I have "always" tested simple patches by rebuilding just the affected
driver on whatever kernel I happen to run.  Like this:

bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/4.19.0-9-amd=
64/build M=3D$(pwd)/drivers/net/usb clean
make: Entering directory '/usr/src/linux-headers-4.19.0-9-amd64'
  CLEAN   /usr/local/src/git/linux/drivers/net/usb/Module.symvers
make: Leaving directory '/usr/src/linux-headers-4.19.0-9-amd64'
bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/4.19.0-9-amd=
64/build M=3D$(pwd)/drivers/net/usb qmi_wwan.ko
make: Entering directory '/usr/src/linux-headers-4.19.0-9-amd64'
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.o
  MODPOST 1 modules
  CC      /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.mod.o
  LD [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.ko
make: Leaving directory '/usr/src/linux-headers-4.19.0-9-amd64'


But this is broken for some reason with recent Debian (bullseye/sid)
kernels, based on 5.6 or 5.7 kernels.  They will always compile all
source files in the directory, even of most of them are not necessary
for the requested target:


bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/5.7.0-1-amd6=
4/build M=3D$(pwd)/drivers/net/usb clean
make: Entering directory '/usr/src/linux-headers-5.7.0-1-amd64'
  CLEAN   /usr/local/src/git/linux/drivers/net/usb/Module.symvers
make: Leaving directory '/usr/src/linux-headers-5.7.0-1-amd64'
bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/5.7.0-1-amd6=
4/build M=3D$(pwd)/drivers/net/usb qmi_wwan.ko
make: Entering directory '/usr/src/linux-headers-5.7.0-1-amd64'
  AR      /usr/local/src/git/linux/drivers/net/usb/built-in.a
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/catc.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/kaweth.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/pegasus.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/rtl8150.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/r8152.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/hso.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/lan78xx.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/asix_devices.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/asix_common.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/ax88172a.o
  LD [M]  /usr/local/src/git/linux/drivers/net/usb/asix.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/ax88179_178a.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_ether.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_eem.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/dm9601.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/sr9700.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/sr9800.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/smsc75xx.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/smsc95xx.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/gl620a.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/net1080.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/plusb.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/rndis_host.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_subset.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/zaurus.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/mcs7830.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/usbnet.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/int51x1.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc-phonet.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/kalmia.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/ipheth.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/sierra_net.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/cx82310_eth.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_ncm.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/huawei_cdc_ncm.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/lg-vl600.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/cdc_mbim.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/ch9200.o
  MODPOST 1 modules
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.mod.o
  LD [M]  /usr/local/src/git/linux/drivers/net/usb/qmi_wwan.ko
make: Leaving directory '/usr/src/linux-headers-5.7.0-1-amd64'




Why is this? Am I doing something wrong here?

This is quite annoying.  Not only does it take much more time than
necessary.  It also causes the build to fail if any of the unnecessary
source files fail to build.  Which is expected with my use case,
building unmodified drivers from a different kernel version.  E.g trying
to rebuild qmi_wwan from the current net/master repo on a Debian 5.6
kernel fails because r8152.c implement new ethtool_ops fields:

bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/5.6.0-2-amd6=
4/build M=3D$(pwd)/drivers/net/usb clean
make: Entering directory '/usr/src/linux-headers-5.6.0-2-amd64'
  CLEAN   /usr/local/src/git/linux/drivers/net/usb/Module.symvers
make: Leaving directory '/usr/src/linux-headers-5.6.0-2-amd64'
bjorn@miraculix:/usr/local/src/git/linux$ make -C /lib/modules/5.6.0-2-amd6=
4/build M=3D$(pwd)/drivers/net/usb qmi_wwan.ko
make: Entering directory '/usr/src/linux-headers-5.6.0-2-amd64'
  AR      /usr/local/src/git/linux/drivers/net/usb/built-in.a
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/catc.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/kaweth.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/pegasus.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/rtl8150.o
  CC [M]  /usr/local/src/git/linux/drivers/net/usb/r8152.o
/usr/local/src/git/linux/drivers/net/usb/r8152.c: In function =E2=80=98r815=
2_tx_csum=E2=80=99:
/usr/local/src/git/linux/drivers/net/usb/r8152.c:2004:4: error: implicit de=
claration of function =E2=80=98tcp_v6_gso_csum_prep=E2=80=99 [-Werror=3Dimp=
licit-function-declaration]
 2004 |    tcp_v6_gso_csum_prep(skb);
      |    ^~~~~~~~~~~~~~~~~~~~
/usr/local/src/git/linux/drivers/net/usb/r8152.c: At top level:
/usr/local/src/git/linux/drivers/net/usb/r8152.c:6360:3: error: =E2=80=98co=
nst struct ethtool_ops=E2=80=99 has no member named =E2=80=98supported_coal=
esce_params=E2=80=99
 6360 |  .supported_coalesce_params =3D ETHTOOL_COALESCE_USECS,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/src/git/linux/drivers/net/usb/r8152.c:6360:31: error: =E2=80=98E=
THTOOL_COALESCE_USECS=E2=80=99 undeclared here (not in a function); did you=
 mean =E2=80=98ETHTOOL_SCOALESCE=E2=80=99?
 6360 |  .supported_coalesce_params =3D ETHTOOL_COALESCE_USECS,
      |                               ^~~~~~~~~~~~~~~~~~~~~~
      |                               ETHTOOL_SCOALESCE
cc1: some warnings being treated as errors
make[2]: *** [/usr/src/linux-headers-5.6.0-2-common/scripts/Makefile.build:=
273: /usr/local/src/git/linux/drivers/net/usb/r8152.o] Error 1
make[1]: *** [/usr/src/linux-headers-5.6.0-2-common/Makefile:1704: /usr/loc=
al/src/git/linux/drivers/net/usb] Error 2
make: *** [/usr/src/linux-headers-5.6.0-2-common/Makefile:180: sub-make] Er=
ror 2
make: Leaving directory '/usr/src/linux-headers-5.6.0-2-amd64'



This is obviously completely irrelevent for the qmi_wwan build.  How to
I get back the old dependency based building?



Bj=C3=B8rn

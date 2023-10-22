Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2FC7D2547
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Oct 2023 20:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjJVSYy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Oct 2023 14:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjJVSYx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Oct 2023 14:24:53 -0400
Received: from sonic303-22.consmr.mail.sg3.yahoo.com (sonic303-22.consmr.mail.sg3.yahoo.com [106.10.242.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939E9EE
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Oct 2023 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1697999087; bh=N5CypG7Vl4VknCnCFCipYrwiXfRZkomWpUPNVWbe9RQ=; h=Date:From:Reply-To:To:Cc:Subject:References:From:Subject:Reply-To; b=Y4XZmvWk1Qx0ENYmFkoIz4s4bQ59NWGwUZRuOZwhFinjMOO2MKhr0B3Cv20+i5rp3fxd5ytLFSlgsOaqvYyC+p1uFNNXbeq54vCv1Q3935w/6BrUaSJfV1PUPPWnt9oF2bwthFe7JQsoYS67LK7LZhLAnIsbQq1RrGiKKvH7Ir9xZMZ0uyoYl12k/H2W6cutAETBQxNz63D7bw/BbnQGYIjYZI9ysuQ2P8F3K7h5MfiktgU30sNbDtf04dwrDhPAPx1jg/vKF2lA3pTk7y6SYQ7FAB8E5MHZQrD6RhTc1PGdBgwfb7tQdo5/RoG4o1bp5KPbzMu/JbS4lx12tgvePg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1697999087; bh=Shg6E0mlR/vE5NRkjIQ+iAbOydHEv0yHmPHoyN7zDG6=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=aVevno3Mh4qqqHKbSRtQSAQNTwueTFLOAv1QTzJ4w2SvwCCyIs2yHxrz3QYjOWV+VsSP7AfKi1bRIkfiMZ79FR5BCLQJndZHBzEyoOLp8Gwbd+XStKwA8KFXtnOSlobLtNpHAyXcFldCZwhAoACVR5OeOrGZx5GDQ+gN6Bn4TpcnJqQMYLwAP/zj2VTNuzO0c4QiUzEWGO6Pc6N+qkNZay8tMdKhuPqtNb9D7znXzdThTrL2dw37TNio0UiS80FqvffrWKmd6HZJigMyYo+pslVYKiMHXb9fHhZ0ZGNSLiQMNcgzyIN/gvuGQCxQ7f9UaqbcRelQCxQotflBsKsWEg==
X-YMail-OSG: QdaEmsMVM1ms1.cQDa.FIBvKiP43z.v34gbnZmnRf2NmDCRlNsQq2lWBdBpt1E8
 GmByQaFn9kppDSywDxGafZLM8Y35kv11WEI2Kb9wfBI.z7UdSZobPLYitQijv_TIxQQ4kUU2QdLH
 q9rYhOGRXx0iux0UtRcTDApbHLHQ97e_HbB4cD1IHJ3fvKm.kndvSyloEBODfFvtkuKraSHXYY2Q
 2iY2.Nlz5OZUmTGGobKWZOrhYcVzqEDH4UlAQuw69y6sWzBnZywvXm1KYcSKjAJUFb9B_Q4rekux
 _Z9C1jONOqUUEMNtWOL8d4mcsU76z6sfhY_KKhfh9F.dsYZaia7wYe36PojAH2kEGSZ1jewVsFhF
 BDD06hWrRnK8o5ElADm6kBSlYfPxB3WnfvjhnKvHW5HzMAjNuXS_lXV.XpE0OjX8x9KogCX0RrTW
 xc_3T3Tw1Wf.TvzndXFLkrqOgdSwnqQh3aoSSmUXsz_4Z.HVTH3Ao4tz7z9wzzE0gHuLAzHIhfLi
 dUs32PfgOSa6hnYxKi.4rgFwkZ99CH4ra4YH6vDARF0VzdHig38Yfm.DpFwDLsmZnxNch2TaVGzn
 EPv_eddioL9N7LJO1vhDM5JNF6MksD.Q2WIGoFLdTW2D3p1xLITSdBq3upiqYPG1wKTbfNZlEA6_
 SKpDlxIoILmbaSuUYch4BrtU8tzYRSJeoYCorZmp07RKD2.SzFJg1WL02_9Mwlmwm7r1cewj8rNE
 9pM7FxoX58JkQmyfnS3NLWnomfxns8EjIEo0RfRQKF8M_5SoDhuU9ZBi3Fw8gPw9CrXgHtaumX67
 XRbKy35C6TYbylluMRgYrm4mIxiquFqtv2VcamfOHk6RZnm8F7Og4nMjVblzh8571lPs8IMUj9mj
 TZhKnQTSHGAr_tUUTI.2cMvXkB_EAWIjfzMgU3aA.DbIYYZo8k6aiA1Y8mzKX8RvP8Y39v3mWFD3
 vKlPm09E.hKMFAV7nEtyQ5hcetQmeG0iqeyqfqHJv2LPcIGGgQIxzsuSR3YMC1XnRU5nAmxzXeQv
 1Xc8_B_G786DheHEEiqMSX4wSpWCiXVWHYe4NQ9dJoJHu7HvjRo1uV9Iouh5857SOTPl8rNzaFc4
 tI6sua1btSY4Lg9CIULmTc_JL.ujcN0T.QPPAqQBzVH.zLFyICOs05lB_v1SrpfCYwQfDW6MPS.X
 LrCtYAnKNy9lR3ManHieXzncKcHpwBT61x7a479hwZLFAPr7rBGL4Vnvakwa8JnR7ivIiY_XAzoG
 S_lV9OQ.BajIGvwu4T2K2NrWkAtLPJvMLqYuLnatPgyz4VqKlf9SlDAaMJ8ZRqa3hNpOaYAzyGLZ
 rVneK3U_KmgFAB63fUsaBYf6PpJ4Ezj9_XjBrfeVkBN1IbdBOlv7hqS4sG8FbPYcktNWBWb_mz11
 J.JMKO3ud8rSnG31.kLyff2VTRrcO9h9e4s8JhEM7gIyfpCE42N1odKpInsV4I.0drbtoN4ZLgan
 3CmpouPT8sVJqn3QItEKtY2BPmElWOCgZeDYtcv8k.F5z4T3H8HTzKFrEUa.sU4hIjEQwKrxelRQ
 BSCM9Qra.fEgr36MovE2WCYayCoxoQUee9sMPnjTq.xBV1T0m0g4M_2qDPRQoO1cNgIrp.v1HSAV
 _22QtP_glXlnTKtYDsCSBEUQtRwJKSgH9P7QfAd.buIYAAhp5McRDjnCgjrhRhu8tGyZM6rqIBph
 7JHsn2lcEOlZdz43qR5Ntr1tQdVq3tUm8Jd4XFg6NkmAEEU4rESPy7UeoqFRWwIOvxiGIqjiJ84r
 eGUg04vIL_Xv1Hxx2V7zoszaftnpuwxpYFMj1QTU9gEAukAH1o9lb14n53HqtYFBj6vcTSJuv74a
 Q912hKp5bBDnQ.B95QOLu3Qqc5YjBDFsB8tMpzdMVKtd1Pukrb4odIorz7L1t2MWeZGjtpOI1oWO
 ItdBn.llAuo.7_.k2sl_3EdPyyVjZ.0TQSBpXkECmilHgYnhTmzQCg6x_YMPkr75bmSW1V318iYD
 KQWqXtyzxk03H98P01L3GVt5i8sXDg0Yj.ixmL.73X7nU.EpuZoZBo9Jyh_rvHthkNSN5k8uhA5x
 Pi3J8AIC6zEnzon53N8cj2rmBF8l8RAK0_Xssn9sFVi2EDNdp86eho964rlBRhlndaM7R6cwNPvq
 q1yZRJZyL9LWE.qI4ZKzarWaYTic8f9M_cYP7H4WyEdpuUNRoEMEdzSkyKGyATR5weeoLApwArVn
 0MaK38BGW0HZTaCn1k.epsBply0q9f1YLebwFlyTS5bHsiD_.wTU9aFSbwA--
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: f544fe1d-3ac8-4616-a370-1aa03403d6b2
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Sun, 22 Oct 2023 18:24:47 +0000
Date:   Sun, 22 Oct 2023 18:24:24 +0000 (UTC)
From:   P J P <pjp@fedoraproject.org>
Reply-To: P J P <pj.pandit@yahoo.co.in>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <1236784830.606269.1697999064177@mail.yahoo.com>
Subject: About Kconfig indentation fixes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1236784830.606269.1697999064177.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21797 YMailNorrin
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_REPLYTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NEUTRAL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Masahiro,

Please see: ->=C2=A0https://paste.centos.org/view/06ed8bf0

=3D=3D=3D
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index b59e3041fd62..82ae68b13381 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -68,14 +68,14 @@ config EDD_OFF
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 using the kernel parameter 'edd=3D{on|sk=
ipmbr|off}'.
=C2=A0
=C2=A0config FIRMWARE_MEMMAP
- =C2=A0 =C2=A0bool "Add firmware-provided memory map to sysfs" if EXPERT
- =C2=A0 =C2=A0default X86
- =C2=A0 =C2=A0help
- =C2=A0 =C2=A0 =C2=A0Add the firmware-provided (unmodified) memory map to =
/sys/firmware/memmap.
- =C2=A0 =C2=A0 =C2=A0That memory map is used for example by kexec to set u=
p parameter area
- =C2=A0 =C2=A0 =C2=A0for the next kernel, but can also be used for debuggi=
ng purposes.
+ =C2=A0 =C2=A0 =C2=A0 bool "Add firmware-provided memory map to sysfs" if =
EXPERT
+ =C2=A0 =C2=A0 =C2=A0 default X86
+ =C2=A0 =C2=A0 =C2=A0 help
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 Add the firmware-provided (unmodified) memory=
 map to /sys/firmware/memmap.
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 That memory map is used for example by kexec =
to set up parameter area
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 for the next kernel, but can also be used for=
 debugging purposes.
=C2=A0
- =C2=A0 =C2=A0 =C2=A0See also Documentation/ABI/testing/sysfs-firmware-mem=
map.
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 See also Documentation/ABI/testing/sysfs-firm=
ware-memmap.
=C2=A0=C2=A0
=C2=A0config DMIID
- =C2=A0 =C2=A0bool "Export DMI identification via sysfs to userspace"
- =C2=A0 =C2=A0depends on DMI
- =C2=A0 =C2=A0default y
+ =C2=A0 =C2=A0 =C2=A0 bool "Export DMI identification via sysfs to userspa=
ce"
+ =C2=A0 =C2=A0 =C2=A0 depends on DMI
+ =C2=A0 =C2=A0 =C2=A0 default y
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Say Y here if you want to query SMBIOS/D=
MI system identification
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 information from userspace through /sys/=
class/dmi/id/ or if you want=C2=A0
=3D=3D=3D

* IIUC majority of Kconfig entries use leading tab(\t) character(s) for ind=
entation. But there are multiple Kconfig entries like above wherein indenta=
tion is without the leading tab(\t) character. Ex. above entries use 4 spac=
es (" =C2=A0 ") for indentation.

* I wanted to check
=C2=A0 - is it okay to send fix patches for such inconsistencies? They may =
lead to errors.
=C2=A0 -=C2=A0if Kconfig file has no assigned maintainer(s), should the pat=
ch go to -kbuild@ list?

* The Kconfig language text below does not say anything about indentation o=
r usage of leading tab(\t) characters. Is that intentional?

=C2=A0=C2=A0https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.=
html#menu-dependencies

* Is there some method/rule to the indentation in Kconfig files/entries?


Thank you.
---
=C2=A0 -Prasad

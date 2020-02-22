Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B71168C43
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 05:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgBVEBd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 23:01:33 -0500
Received: from sonic309-22.consmr.mail.gq1.yahoo.com ([98.137.65.148]:35821
        "EHLO sonic309-22.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727901AbgBVEBd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 23:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1582344091; bh=SmyDn/XTNoDQNtLCOTEhIunn6jzWu2JNNe6w6nOxGRQ=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject; b=i2G37z5w3OyU8vad0ObS9xysQ7645XR6BL+Zc7gkrOYq5/ngkP606//o5ua4jlW/Z61X3/fYKi6roAVti+q7p9IcqsnTM4o4ysnCyDe4a/z2hfRYl63gGPVpp03SGm/cIhEWO2UuNoHFoTlMnEROIQ4byfGxpBpl1rTAqOMyfqPYr343i7tiDb8+WNs63aPvu9U/EuYEHiTgmKzbY70fmoVgb3k9UtvxEru+C+vdR19WsRryyx74EZk6KcF6Q+Me7o8oSavGgHwRJwp0/V3i2Co4nTwQ3tvq1szcpHZImDnivbj1mKhhRqlqlC7Pqxm83SW0/hoMUZ1oTRUe3mzlDQ==
X-YMail-OSG: MtvA3EEVM1kH5VSOR478UUnO13gnQtxVd4TtOjRW3.huOfoPNbvfeJON9jl85gq
 Zj9jfhJC_0bbZenEi3OWj.owvCbyaph9VH0_OJUPCWqE4ECReecbZhPAlvvqW7eeH1GDhR15G8_V
 wmIl3V6RONqnMQsi4MSkynId7vklBnQuyooO8.wMlCI4rlcvcbhdLCVz9vhmK90_NT5M_BMbZhRK
 84JJlbvTeppdA9_lxys.i_3Wc8BGTLJh_rae506ZS3FJ9xTe2PjMDCiBBRR02_uBggf40M60aq9G
 nM271PFtbEvvRwWOldNo7cABR2BJ86oPzJzdDDfJta1xawZYSEx0Ot7tP.n6EWuKR9cQTAmXSfCO
 Kk7zCuAIqZMfEknV9cSS6g5rGGoEMHJJyS15.o7vHLjjot70pgLDJI.Kd1inI7m6Lywjf1lsVBzg
 bDblNZDE6e.a_ZvQnIfRzQXOZ57ugN2I2469HRAPKxQ5Av.zYSEIajD8EzfrBk5QOWA2dkSu6a4f
 RL40uzGGJsaNkmopqs2CLaLSG4LIxXH6mfAkHrIOQ0WOKQTMwNwXAE1Mj0pu8ZP6N.XW5an8Cf4S
 DqUNMjMPl.CuvxX2aeT4KrmHPUiimd5HE9LQQOHq78oIPoz05XeN3IaLrICN1UvCLOfp0yWR78VN
 tonzaAnA9dCIZAeVunS6JcQy7XjHb9rmxEeHFuCtEE9k653hmlUL63GExkjj.tEHXC0BV8SqpRg.
 VByh_ggbOiUeadSB2R3IxzvVgMTK.PbkoCudK3ADUWFtqkt8SCnuh9KNVMsLl0p8rI7lpYwYu_gq
 x8JcWXc33jgT8bWG3XCuNIF4vT7n.YsO1B_Fz.xyrdGDvDH1vp3g9ukmCd7Y4T2GcZd849Dv5fzp
 qEWUnLr.VE0_27uIA5Wh1Jwov2cN9aiTxCzm4NWMbqqM985uKgQhU58jcZYLDcorSr12.7kIrueE
 EdmSLL3Wllk_SI7dVE6FLooxiv2n87i_rwxGBjH.6Ic0d0HHyeiNQxgaz2wo.wHXANab4P_bVXEb
 4oLP8q49rQXfVLi5ccB8Yxow9J8Geoe_MqqqlH9j.bR9cXE6lZ0snysJEdvhVNAnRuexk7ErhX0D
 xCJnVQqGsCsDKbVHuBcae4zz.S08QlqdrRLLkJ_jZb7A1Ai5mczgFpDKDzIXit6WO6UEG4vHAORj
 9n4LaWyeFKkPVSghxyEljuqP5yETW0KK0AiC2w1ZIZbFou_EWgmY16yWcqHUCpyAkbBCTkJGM1kR
 c4X.LCkaAtZqRiQLX6slhO_3I2L84VCAW5suAMYkRfSM.P4G8.Fs7I.ncW0mykqitVK.R9TyOo53
 HI_thxw49_xj0QE._kkvtOoqf_QfNwg0ZhFXXveIsNxUJHawjcK57nSjimaBQthUgsHkm.IahTUH
 NCFI4Lrj4OWs-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.gq1.yahoo.com with HTTP; Sat, 22 Feb 2020 04:01:31 +0000
Received: by smtp402.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID d4852c6b1e461f31238f6e6ed3f1e12e;
          Sat, 22 Feb 2020 04:01:27 +0000 (UTC)
Date:   Fri, 21 Feb 2020 23:01:24 -0500
From:   "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
        <20200222003820.220854-1-alex_y_xu@yahoo.ca>
        <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Message-Id: <1582341758.yo66djba3t.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15302 hermes Apache-HttpAsyncClient/4.1.4 (Java/1.8.0_241)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Excerpts from Nathan Chancellor's message of February 21, 2020 9:16 pm:
> Hi Alex,
>=20
> On Fri, Feb 21, 2020 at 07:38:20PM -0500, Alex Xu (Hello71) wrote:
>> -pipe reduces unnecessary disk wear for systems where /tmp is not a
>> tmpfs, slightly increases compilation speed, and avoids leaving behind
>> files when gcc crashes.
>>=20
>> According to the gcc manual, "this fails to work on some systems where
>> the assembler is unable to read from a pipe; but the GNU assembler has
>> no trouble". We already require GNU ld on all platforms, so this is not
>> an additional dependency. LLVM as also supports pipes.
>>=20
>> -pipe has always been used for most architectures, this change
>> standardizes it globally. Most notably, arm, arm64, riscv, and x86 are
>> affected.
>>=20
>> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
>=20
> Do you have any numbers to show this is actually beneficial from a
> compilation time perspective? I ask because I saw an improvement in
> compilation time when removing -pipe from x86's KBUILD_CFLAGS in
> commit 437e88ab8f9e ("x86/build: Remove -pipe from KBUILD_CFLAGS").
>=20
> For what it's worth, clang ignores -pipe so this does not actually
> matter for its integrated assembler.
>=20
> That type of change could have been a fluke but I guarantee people
> will care more about any change in compilation time than any of the
> other things that you mention so it might be wise to check on major
> architectures to make sure that it doesn't hurt.
>=20
> Cheers,
> Nathan
>=20

Sorry, I should've checked the performance first. I have now run:

cd /tmp/linux # previously: make O=3D/tmp/linux
export MAKEFLAGS=3D12 # Ryzen 1600, 6 cores, 12 threads
make allnoconfig
for i in {1..10}; do
    make clean >/dev/null
    time make XPIPE=3D-pipe >/dev/null
    make clean >/dev/null
    time make >/dev/null
done

after patching -pipe to $(XPIPE) in Makefile.

Results (without ld warnings):

make > /dev/null  130.54s user 10.41s system 969% cpu 14.537 total
make XPIPE=3D-pipe > /dev/null  129.83s user 9.95s system 977% cpu 14.296 t=
otal
make > /dev/null  129.73s user 10.28s system 966% cpu 14.493 total
make XPIPE=3D-pipe > /dev/null  130.04s user 10.63s system 986% cpu 14.252 =
total
make > /dev/null  129.53s user 10.28s system 972% cpu 14.379 total
make XPIPE=3D-pipe > /dev/null  130.29s user 10.17s system 983% cpu 14.288 =
total
make > /dev/null  130.19s user 10.52s system 968% cpu 14.530 total
make XPIPE=3D-pipe > /dev/null  129.90s user 10.47s system 978% cpu 14.343 =
total
make > /dev/null  129.50s user 10.81s system 959% cpu 14.620 total
make XPIPE=3D-pipe > /dev/null  130.37s user 10.60s system 975% cpu 14.446 =
total
make > /dev/null  129.63s user 10.18s system 972% cpu 14.374 total
make XPIPE=3D-pipe > /dev/null  131.29s user 9.92s system 1016% cpu 13.899 =
total
make > /dev/null  129.96s user 10.39s system 961% cpu 14.596 total
make XPIPE=3D-pipe > /dev/null  131.63s user 10.16s system 1011% cpu 14.015=
 total
make > /dev/null  129.33s user 10.54s system 970% cpu 14.405 total
make XPIPE=3D-pipe > /dev/null  129.70s user 10.40s system 976% cpu 14.349 =
total
make > /dev/null  129.53s user 10.25s system 964% cpu 14.494 total
make XPIPE=3D-pipe > /dev/null  130.38s user 10.62s system 973% cpu 14.479 =
total
make > /dev/null  130.73s user 10.08s system 957% cpu 14.704 total
make XPIPE=3D-pipe > /dev/null  130.43s user 10.62s system 985% cpu 14.309 =
total
make > /dev/null  130.54s user 10.41s system 969% cpu 14.537 total

There is a fair bit of variance, probably due to cpufreq, schedutil, CPU=20
temperature, CPU scheduler, motherboard power delivery, etc. But, I=20
think it can be clearly seen that -pipe is, on average, about 0.1 to 0.2=20
seconds faster.

I also tried "make defconfig":

make > /dev/null  1238.26s user 102.39s system 1095% cpu 2:02.33 total
make XPIPE=3D-pipe > /dev/null  1231.33s user 102.52s system 1081% cpu 2:03=
.29 total
make > /dev/null  1232.92s user 102.07s system 1096% cpu 2:01.71 total
make XPIPE=3D-pipe > /dev/null  1239.59s user 102.30s system 1096% cpu 2:02=
.39 total
make > /dev/null  1229.81s user 101.72s system 1093% cpu 2:01.74 total
make XPIPE=3D-pipe > /dev/null  1234.64s user 101.30s system 1098% cpu 2:01=
.64 total
make > /dev/null  1228.50s user 104.39s system 1093% cpu 2:01.91 total
make XPIPE=3D-pipe > /dev/null  1238.78s user 102.57s system 1099% cpu 2:01=
.99 total
make > /dev/null  1238.26s user 102.39s system 1095% cpu 2:02.33 total

I stopped after this because I needed to use the machine for other=20
tasks. The results are less clear, but I think there's not a big=20
difference one way or another, at least on my machine.

CPU: Ryzen 1600, overclocked to ~3.8 GHz
RAM: Corsair Vengeance, overclocked to ~3300 MHz, forgot timings
Motherboard: ASRock B450 Pro4

I would speculate that the recent pipe changes have caused a change in=20
the relative speed compared to 2018. I am using 5.6.0-rc2 with -O3=20
-march=3Dnative patches.

Regards,
Alex.

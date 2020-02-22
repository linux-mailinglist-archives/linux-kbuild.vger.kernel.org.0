Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A62E168F4E
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 15:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbgBVOYV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Feb 2020 09:24:21 -0500
Received: from sonic316-54.consmr.mail.gq1.yahoo.com ([98.137.69.30]:36959
        "EHLO sonic316-54.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727184AbgBVOYV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 09:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1582381460; bh=liTe1C7UBRwJrfq2LfqWSrRW/RTFPmELB83A9NRLLsY=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject; b=ZfYsdNcypCF9yz5FwYNKx/LH5bJNdeKW3gV8elm9sIturkgLwhONj8KVWJuyLLup1eSJv3rEB14h0i1+cS8XzPRWSJe3ttKB0VyqZTCcwIZcWIKSqstEVaQHxjVuUyMepBp4Iwu2IDyFczBgyUNZnFs+EK9iLvwDGYTdrlHU8UGLCyT1GRrRcDqPsTT1Pek3mLpQEF2LjnyIGcDvkxVDnevGoatfKzdf8oXvlqtd7+5aSQ8h54bk8mjRC6cCSXUzOZTblR8AMKQT24jUrE1nBIKxc3Iz0atHWBCcbinOJrciBd1MbCRLQtBvdILfnTlbBnSu6vzI3JaOl2kcTKZqOw==
X-YMail-OSG: VkqpVfQVM1lrJ.0Je7pBA9JWf08RYTMppv_B7f8gA.EGZGpAfpkIyc7e6zplYQN
 UATTStDDNz6.n1dGoGqj1mC0USCP3p2eQAY0cVLCrp7S49ckR4w5jRrmKyv.Jf9yfAklKxQCdZU0
 1PtlDuVbrxNpfzpLecoH8owuF9E4WLt5uqgM3uGzG8S2y9BoUjtxHrEVxHAIFD5OGPlGWSTfu.zq
 _UgCajlV5BZq_tDv0YMpYTotHaUuvJP9yPbC.ewyD9lK_4eELZsQdM411con._dEtrbaEOuRslAb
 ZHciIla8N7bC9Wgh63W3Uz_HHVgs_LBYVu_Odeim2DRW4yr8.O1unzzqmwI9Zg6p1toj6SnjUl.O
 cIc.rs5XiQhyxIG7OaF60dHD9k_Ymc8AG6HJb4NbtIDNlfHh_KNrGftR2D_bR0pTyECDpqxnZgLm
 XcQA0qgNlUXkQ2hPfilmWuBjeYvuRUrU556p2hggieKU17MB_JGeoiMZWDzX9Z923nPqZbFDsV0L
 jR8qCcfxCV2x3fiBdlWm1ypEcCIGGZe9oB1j1W0HV.9oXFjCzOjLPWIFsRNKkbgmng4WRXLcmYTp
 UsQbzxyBFSdVK_oEmtJCWsh4cWuWdGVYYTXCcbIXQWGd4Z7y2WG1.WguXPolxGT20H64KMPxZ0Lg
 esS6wtm74bvnnI9c0ihUoDZ..KbEuxLB9MbWIREegoYL39mNJ2GUYOTE_o9.wJ5gVJt3qxF_0GsA
 gA6MFP__2eVzJrYWxmiFH2nv9hFpcRaicRj.HZMTl.kUd0r1iK65a2UFCaoR3OZWr5C29kQhnkvW
 mhXAKzlPzBBt2xRlcZRJ6xMGC0s4nNborWL.RtNDoLf5tn4cfYXu4y43eNgUJ1biK6gEJ0DEDniZ
 .ubxZhjwodt.frmEridyArcu9078lVQO6H5IL_jJJifuDmSo43q.BT5DOZ27MRJfFHjD2T3xfiby
 lp97Q4wDrR4U95yuNxi39MUL48WPy83w8Q5PPhDIwOPVDQ_A7UKeZB5zuq_5U5YEsUj92ZkY_KNF
 icdU1eqaQkl9IgKFFLM1SNRacuGigqCzCheq7nnkFB55Mmn7pB5PQTYB4E1OFFWezYLUsW0TQ69w
 yeBmn3YS_AzsoaHaKGXsTG3mv0cGi1J5EcyRizNc24GJ.LiWJRJya7JFF78FRklgS.FQ7ZYxxdyP
 4ogwHnmStvMXpzTDX.wltiENJG52rvLQDdBq3voKDItdCMmwI1FHhH0LIZSu0qmXJZ8NKXdMmxT2
 Um0i1YQOjziCwAsaqRuQPAI5DZCUeTNhvOOpi_4ZKHzaSBGTBjQY0fa07gK3xeF.cpnnlQ_MuwzW
 9KANdn0DTsGcVKywO_hgisaHLhT4GohrbwQmdPJYetJmVY6UDRAcgPvS_LysWHvUgMuwaTTuDC8A
 xpsczsxVD
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Sat, 22 Feb 2020 14:24:20 +0000
Received: by smtp401.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 08d9970ba44d42f11deb6bf6cb444e34;
          Sat, 22 Feb 2020 14:24:17 +0000 (UTC)
Date:   Sat, 22 Feb 2020 09:24:14 -0500
From:   "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
        <20200222003820.220854-1-alex_y_xu@yahoo.ca>
        <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
        <1582341758.yo66djba3t.none@localhost>
        <20200222080140.GA40311@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200222080140.GA40311@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Message-Id: <1582381271.1karmgahx0.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15302 hermes Apache-HttpAsyncClient/4.1.4 (Java/1.8.0_241)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Excerpts from Nathan Chancellor's message of February 22, 2020 3:01 am:
> I used hyperfine [1] to run a quick benchmark with a freshly built
> GCC 9.2.0 for x86 and aarch64 and here are the results:
>=20
> In both cases it seems like performance regresses (by 1% but still) but
> maybe it is my machine, even though this benchmark was done on a
> different machine than the one from my commit back in 2018.
>=20
> I am not sure I would write off these results, since I did the benchmark
> 25 times on each one back to back, eliminating most of the variance that
> you described.
>=20
> [1]: https://github.com/sharkdp/hyperfine
>=20
> Cheers,
> Nathan
>=20

What kernel version are you running? Do you have the 5.6 pipe reworks?

Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4F5365456
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Apr 2021 10:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhDTIlJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Apr 2021 04:41:09 -0400
Received: from terminus.zytor.com ([198.137.202.136]:39629 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhDTIlI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Apr 2021 04:41:08 -0400
Received: from [IPv6:2601:646:8602:8be1:8819:5cf:8dbc:ccf4] ([IPv6:2601:646:8602:8be1:8819:5cf:8dbc:ccf4])
        (authenticated bits=0)
        by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 13K8e0ZZ2595300
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Tue, 20 Apr 2021 01:40:02 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 13K8e0ZZ2595300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2021032801; t=1618908002;
        bh=KJKMGIt2BbVzz/RVohFuZ6xbiX0t9dut89vlYcz/mvI=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=Op8t7gpsMQMVlDrQe4GkU0ikDUSLt55q7u/o1YLWG+C/ZWXCPlmK26VO3VoEEpFzb
         cNm4iD2zpR/e5S3niHy9NWQHCfJ9o+HHQy2M28+T6XIQgFKS36q5lTWvBhS1bYfwSx
         60Z6XDKYOeIYWRXw4+K4Rkgb5dvpF+d7U3IX1WT0Ym0cB5hExRXVS1S2b6KHsyCLSp
         MO9dSyDf+M9nv8I8DTQrDlciULP0RrsdYmgH9GD+dV1sIZHUrbdwCcsFiw8QpWMPEq
         4GFWmvxJFzzZTeUoBQTVNq+31KR/S71K4OI+WlsNPV/5/GrmgiuH0OIJYpNCFRGHmW
         CCiTu7IK+0szA==
Date:   Tue, 20 Apr 2021 01:39:51 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <75fc46bae17f4fa4958f5ad7d49d9244@AcuMS.aculab.com>
References: <20210419230252.1583169-1-hpa@zytor.com> <75fc46bae17f4fa4958f5ad7d49d9244@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 0/3] x86 disk image and modules initramfs generation
To:     David Laight <David.Laight@ACULAB.COM>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kbuild Mailing List <linux-kbuild@vger.kernel.org>
From:   "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <B394A852-DE98-4B68-BAEC-DCAD582B1EF4@zytor.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Ok=2E=2E=2E not really sure how this relates to my patch=2E You are mention=
ed three separate things: modules, headers, and enough of the kernel machin=
ery to build out of tree modules=2E The latter it normally done with a tree=
 that corresponds to the state after build + "make clean"; which I *believe=
* is the same as after "make prepare"=2E The former two are "make modules_i=
nstall" and "make headers_install", respectively=2E Note you can direct the=
m to directory hierarchies other than the local system ones for archiving=
=2E

It is simply not possible to provide a *general* solution that fits all di=
stributions =C3=97 all boot scenarios=2E

On April 20, 2021 1:30:07 AM PDT, David Laight <David=2ELaight@ACULAB=2ECO=
M> wrote:
>From: H=2E Peter Anvin
>> Sent: 20 April 2021 00:03
>>=20
>> When compiling on a different machine than the runtime target,
>> including but not limited to simulators, it is rather handy to be
>able
>> to produce a bootable image=2E The scripts for that in x86 are
>> relatively old, and assume a BIOS system=2E
>
>I've given up and copied the kernel tree onto all my test systems=2E
>
>I needed something like 'make modules_install' and 'make install'
>that would generated a directory tree that could be copied (scp -r)
>onto the target system=2E
>
>But the script to run 'update-grub' is all intwined in the commands=2E
>
>You also don't get a copy of the headers=2E
>Even for the local system (as root) you just get a symlink into
>the source tree=2E
>This causes a problem trying to build 'out of tree' modules
>after updating the kernel source tree (but not rebulding)=2E
>
>I can (and do) write 'horrid' makefiles (gmake and nmake)
>but this seemed to need more refactoring that I wanted to do=2E
>
>	David
>
>-
>Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
>MK1 1PT, UK
>Registration No: 1397386 (Wales)

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

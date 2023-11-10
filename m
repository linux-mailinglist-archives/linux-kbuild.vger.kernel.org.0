Return-Path: <linux-kbuild+bounces-10-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB5B7E7FC9
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 18:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79DE5280C08
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 17:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2B538FA3;
	Fri, 10 Nov 2023 17:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7621A1F;
	Fri, 10 Nov 2023 17:58:56 +0000 (UTC)
Received: from a3.inai.de (a3.inai.de [IPv6:2a01:4f8:10b:45d8::f5])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7A269926;
	Fri, 10 Nov 2023 09:57:53 -0800 (PST)
Received: by a3.inai.de (Postfix, from userid 25121)
	id 99D8C58726689; Fri, 10 Nov 2023 18:57:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 9220D60D2EA0B;
	Fri, 10 Nov 2023 18:57:48 +0100 (CET)
Date: Fri, 10 Nov 2023 18:57:48 +0100 (CET)
From: Jan Engelhardt <jengelh@inai.de>
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>, 
    linux-modules@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
    Lucas De Marchi <lucas.de.marchi@gmail.com>, 
    =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
    Jiri Slaby <jslaby@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH rebased] kbuild: rpm-pkg: Fix build with non-default
 MODLIB
In-Reply-To: <20231110174422.GY6241@kitsune.suse.cz>
Message-ID: <9924rs47-0029-0227-p927-980rs881126p@vanv.qr>
References: <20231009140733.GV6241@kitsune.suse.cz> <CAK7LNAQQMFUt4R1m_U8kBY5=BvxD_dMuE4MD4kpd48WK1E+AGA@mail.gmail.com> <20231010101552.GW6241@kitsune.suse.cz> <CAK7LNASX2_-xt3Qvxie_G=Q4fuVYR6eE47QjQ5NZf7QxY-4_tQ@mail.gmail.com> <20231017104453.GG6241@kitsune.suse.cz>
 <CAK7LNASKPg0JK0QsLGb1Rfx2ysvHJTm3NFOvtwOpZRz4-20T8w@mail.gmail.com> <20231017122747.GH6241@kitsune.suse.cz> <CAK7LNAT3N82cJD3GsF+yUBEfPNOBkhzYPk37q3k0HdU7ukz9vQ@mail.gmail.com> <20231017151050.GJ6241@kitsune.suse.cz> <p86sq573-s32q-6792-4978-43s1pn91r027@vanv.qr>
 <20231110174422.GY6241@kitsune.suse.cz>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


On Friday 2023-11-10 18:44, Michal Suchánek wrote:
>> It's a complicated mumble-jumble. Prior art exists as in:
>> 
>>  /opt/vendorThing/bin/...
>>  /usr/X11R6/lib/libXi.so.6 [host binary]
>>  /usr/x86_64-w64-mingw32/bin/as [host binary]
>>  /usr/x86_64-w64-mingw32/sys-root/mingw/bin/as.exe [foreign binary]
>>  /usr/platform/SUNW,Ultra-2/lib/libprtdiag_psr.so.1 [looks foreign]
>> 
>> The use of suffix-based naming must have been established sometime
>> near the end of the 90s or the start of 2000s as the first biarch
>> Linux distros emerged. Probably in gcc or glibc sources one will find
>> the root of where the use of suffix identifiers like /usr/lib64
>> started. Leaves the question open "why".
>
>That's pretty clear: to be able to install libraries for multiple
>architectures at the same time.

Well, what I tried to express or imply was something like:

“ we could (should?) have used /usr/<triplet>/lib rather than
  /usr/lib<suffixortriplet> all along, because at some point, there *will* be
  someone who wants to provide not only arch-different libraries, but *also*
  arch-different binaries (for whatever reason).


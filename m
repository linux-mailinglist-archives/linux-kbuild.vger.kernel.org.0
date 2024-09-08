Return-Path: <linux-kbuild+bounces-3480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25F970919
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 19:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21FC7B2174F
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 17:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D459176ABB;
	Sun,  8 Sep 2024 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="LN0NljIh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0346176AAD
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Sep 2024 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725817267; cv=none; b=ClodqvZDR5eNeMwe3qWoIFO74de6bcrqADuSOcWDXLF+2q/zZQ+NsTSc7KoistUatzdoYq4XYopBc2euQwoxNePmLETwparWoMJpCJwr+YxZ55uUEMPjhXMU5G69vrGBpSNu4J/gtv2exNmtdtSKbq08IqHl6idX/C5D5qdlS8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725817267; c=relaxed/simple;
	bh=4x2mtOQlRb0PLQYsIdFIS4OpJJNhyfJXhcP1AXkKZFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzIF4W1Lv2f6iS9JRXl6Mx3Jcxdj3AUKZkfd4FUnAwN+GZQieTZUT6ydMNioAHEiQHUJRv07nYbyxsXKe2OAaHbLzafZ7QaPKWJYjhpt7dlc7S/yS+C9EFlfX5R1ya0yPYpi0H81EXp0AVk2v7ws8du6zjpdwg2mhhQejNTk2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com; spf=pass smtp.mailfrom=kruces.com; dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b=LN0NljIh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kruces.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a83562f9be9so330480266b.0
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Sep 2024 10:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1725817262; x=1726422062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fviFcg3HLptplXdgVPwFETuKylRy16bbpArI+x9x9sA=;
        b=LN0NljIhDtci46y5821Icol6w7HqTFR87kHW5PnGIrra0IolyMp2AM7qq7en1ZIFOH
         DkkzCLPasGSsdnmtbOKL4XT5KhotFdI3U3XGH0LRLrbqF2Yrvfzh6OXsbSzGFYTEtim9
         6a70deZRb01aJAx5xut41oe2hSXkfVsVX6/nnLa1SBJjfSLP6vr6Y4KHy1AcZWcFBB8L
         /6tKlM6BA63YrPD/W7lDI4J4ZD7K5j+g9lZerHVCVzg3FwMDXV9ixfWECl5CFsThsh9M
         fd/cZRwfj8nPiaGYyWSh+XBND95HHMf+RJPfC5+v1ziAPqe7lK8WY1AFy4sdqRtexz8B
         FlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725817262; x=1726422062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fviFcg3HLptplXdgVPwFETuKylRy16bbpArI+x9x9sA=;
        b=Z0BB5w78GPOmj24caRJSUTGlN/OP6H5ZCoI2i/ss6d1aCtM73ZLzbjyMxe0Ix3hD1U
         FZfuuP89pidKwGPPeezVDSZMTqUFtibgDk7K8ijDpuunEAvA0EJS2vZJCkHxoSh/3rJk
         1WCjZMuIFqG53feKBOvdHuCasPwsJM2Eqdig1CVT99oMM3PUKiEK61Rgxtg+wuN/Onjy
         53VqemZJGzZvgLf+ZR+mU2KcPHZGU1Xv8fTAWCk6n7w9tiFAKKrXtg4l9nimLchjhWfJ
         ihct5p1x+7CgBK/eOIGAqrnjs9d4ljPz+AI5k0G58S6AkE+aFPSdqJEOkUgR1/cvc3jF
         ZbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM32Y/D8BqEz7f2/oubq1PTU+mLPBEP7OPihAVMZQDl2Di8iRdLw7pK77MUkLlfJgXCE7J10MX9rPfUSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpB/r38TCb3BdV0jXpR0E8ZeA63BWGDXAKq/arB8fZkz96Af+G
	0YwPR9i7kQgjML8GAp9EhnAFkvqGCT+QnRluwaUhYWR7V6ePRHC5oqEkQ+aWCT9U7Y7ih03pnzk
	3a+2nNSfMpm63gytG5RFVaY5d5tkTdow+XUGLnw==
X-Google-Smtp-Source: AGHT+IG0taDaRweGpDhiFssf20qgh8akE04jwmSCvgTsBJig1BN0pA1T1q/8W0tMp8E8Ed3WvXCdk5VBeHS2T6PZWVU=
X-Received: by 2002:a17:907:9690:b0:a8d:2faf:d343 with SMTP id
 a640c23a62f3a-a8d2fafee8fmr226989166b.27.1725817261797; Sun, 08 Sep 2024
 10:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-2-06beff418848@samsung.com> <CAK7LNARw-7uwJB7ibmSYE5nYUtPXcr4J9cHBQqm9BnNS=SRUhQ@mail.gmail.com>
In-Reply-To: <CAK7LNARw-7uwJB7ibmSYE5nYUtPXcr4J9cHBQqm9BnNS=SRUhQ@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Sun, 8 Sep 2024 19:40:34 +0200
Message-ID: <CABj0suCHeWGDXX-S6U9X5iCzwMqn9pq=i84PSKwKtUXhGxaBjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] file2alias: fix uuid_t definitions for macos
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 8, 2024 at 1:56=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Daniel Gomez <da.gomez@samsung.com>
> >
> > The uuid_t struct defined in sys/types.h on macOS hosts conflicts with
> > the one defined in file2alias, resulting in the typedef redefinition
> > error below. To resolve this conflict, define the _UUID_T and
> > __GETHOSTUUID_ in file2alias HOSTCFLAGS.
> >
> > Error:
> >   HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
> > error: typedef redefinition with different types ('struct uuid_t' vs
> > '__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       |
> > ^
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
> >    typedef __darwin_uuid_t uuid_t;    |                         ^
> > scripts/mod/file2alias.c:1354:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:19: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:31: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:43: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:55: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:19: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:31: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:43: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:55: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:20: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:33: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:46: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:59: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1357:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1357 |
> >  uuid->b[15]);      |                 ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > 17 errors generated.
> >
> > Suggested-by: Nicolas Schier <nicolas@fjasle.eu>
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  scripts/mod/Makefile     | 2 ++
> >  scripts/mod/file2alias.c | 3 +++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> > index c729bc936bae..75c12c045f21 100644
> > --- a/scripts/mod/Makefile
> > +++ b/scripts/mod/Makefile
> > @@ -8,6 +8,8 @@ modpost-objs    :=3D modpost.o file2alias.o sumversion.=
o symsearch.o
> >
> >  devicetable-offsets-file :=3D devicetable-offsets.h
> >
> > +HOSTCFLAGS_file2alias.o +=3D -D_UUID_T -D__GETHOSTUUID_H
> > +
> >  $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FORCE
> >         $(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)
> >
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index 99dce93a4188..ab743f6d60ef 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -11,6 +11,9 @@
> >   */
> >
> >  #include "modpost.h"
> > +#ifdef __APPLE__
> > +#define uuid_t sys_uuid_t
> > +#endif
> >  #include "devicetable-offsets.h"
>
>
>
>
> Is this what Nicolas suggested?
> https://lore.kernel.org/lkml/20240807-sexy-roadrunner-of-acceptance-a84bb=
f@lindesnes/
>
>
> I thought he suggested replacing #ifdef __APPLE__
> with -D_UUID_T -D__GETHOSTUUID_H.
>
>
> You added -D_UUID_T -D__GETHOSTUUID_H,
> keeping #ifdef __APPLE__.

I forgot to remove this.

Based on your suggestion in the other thread to use/overwrite
HOSTCFLAGS via the command line, it seems I should drop this patch.
Can you confirm?

>
>
>
>
>
>
>
>
>
> >  /* We use the ELF typedefs for kernel_ulong_t but bite the bullet and
> >
> > --
> > 2.46.0
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada


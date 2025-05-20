Return-Path: <linux-kbuild+bounces-7156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B0ABCC0C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 02:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42F1C7A76A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 00:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD261E492;
	Tue, 20 May 2025 00:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=underview.tech header.i=@underview.tech header.b="fBNeF/Te"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B2B67A
	for <linux-kbuild@vger.kernel.org>; Tue, 20 May 2025 00:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747702069; cv=none; b=ur00OUWhF1LtONcaBK8zdj25/mV+N0wT3MO9Uoy6cvsuQ5u8Pc3a9V3eeXQQZo6GvL/hb3Mz4QGnBRH60GPS8+1iAZih4tEHIU0mJHpC2jmJd19lsE5hrTTZZLSoMgwD+H2QXjkUvq6ny73n1leoMwHPHBzHOp1Dky+G9ednCp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747702069; c=relaxed/simple;
	bh=uf4MV1a8Jg4/1uFXAKDANXlnHKSVp1hl3LgXVRLo60Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lboM1/UPsK0Nb0ApTihXu05hoPxm/gyW4WFnj5ttiiD7X7oWVTQ7wV7B/2AkRbXtoL2IJx7VR407DJIzDOloI9L05wXz87Z1CzwDh3rVL5YjWuWnQE1PikrsA9p7TSwUp1g1JUfklgxmR3YFcPhzfRX/XVsoMrOS5Dssvq/Z9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=underview.tech; spf=pass smtp.mailfrom=underview.tech; dkim=pass (2048-bit key) header.d=underview.tech header.i=@underview.tech header.b=fBNeF/Te; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=underview.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=underview.tech
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a363ccac20so2802692f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 19 May 2025 17:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1747702065; x=1748306865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0esYSysS6XKpa8aEm3BO0ZqWhrWlkz9dLyCPhAB/tk=;
        b=fBNeF/Ten+d3dKd+Dg57NHUTEOvHw2RV0xOnYs6+nGwy7+JUPbDB/6o4HT9c8kWeQS
         1lmDW5bq44s0WCGdBC8rIIRr8Bjou62m5uTPWVdXXBLNxPMT5CokCot62530EglqMyZh
         xM2lFQ2TKsiMA3U7ZHaRD2D/4K8mUbNv5wzDRhYWvU6egPmES3mxkt2QqaG2t7Ula7QM
         IBJb35cDRqCudw1jI1Va5rhZfF8bR8VWMh0pYoBSkKLcHHgcO+cY+3arGKgl3499wOHy
         +7qTsHBgDj1gx9Ref+IoITn0t51UuZnwviMHqILKBw6O7s+uxI7fn3NDak7046LsO4Jd
         4tbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747702065; x=1748306865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0esYSysS6XKpa8aEm3BO0ZqWhrWlkz9dLyCPhAB/tk=;
        b=j1BTf7vhzGNmU8haDzjBZP+chrMKgOG4WSRiSuJX+ofitkhF72uRvjjWfeBmPNjxis
         FKpjVR74TuRuuoFHlBB+wg3RnZGkfpru63eNyWyeEEmIfDeoNVvDHwmnJmzc0n5NebIe
         aWFC5qD5jVHgtI56ScPTeZ+XEHPrkJCllT9dU5f1r4JojEd2oM91Dz1sGSXBEyM9OfKc
         oHzdEJndBunn2ZV2wouuORSD6YTbeGdUSuPtUsHAzmWNPdcHiI+oKNYahrMp4Na9H1/Q
         733m1GoIPWfohPE+QOuei/1qaEpWrzLO4DxCem5kX0YUDFXMC62pu6qjVgpdxmTsV72G
         4KoQ==
X-Gm-Message-State: AOJu0YxgqyCGtC7fXZWbm3GHuypmhgKVa3JfxNpNPSy848oJtAvJaZCG
	E8UYhQ3C6ENV2ZD/ptrDIkbUcG18S+/aVtjKVtDUv6p9qYsrRqWxnnVKqkqDa2rZcpgcoSZcMUo
	AQ6mfstRet9OOa5Cy79yLkj73MzooMNfo0tXJ1Xe3dVEMTMBqIKqN
X-Gm-Gg: ASbGncspnQW7tmNTdmL1VhmHaWk6v88pbxT2NgI9wxtQbkPIwixV4Crq0vTENde5WCa
	C/WbhXCg+bUK5O9RnwqqzRNhQ7ODWimwUdlk1qR+a+KI6mSVAbsY1/8kr/PS2woPTX5WwlU0rio
	/d8egBrWl9snvbrT7bD7uMzsyUWfTh8f2aa4AUmy6c34OGiUdoVBeH/YItun0q7h/w
X-Google-Smtp-Source: AGHT+IFRYkPIHRFiHZrIIZAmcbqbds+wBJ+qMSzuAre7r+feqoPW5JRmNzbPeBvdk25T8GE4zUP2wJcU0yV7zOi8Dys=
X-Received: by 2002:a5d:464f:0:b0:3a0:bdeb:c489 with SMTP id
 ffacd0b85a97d-3a35c83a31cmr11129175f8f.33.1747702065303; Mon, 19 May 2025
 17:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513040409.147881-1-vince@underview.tech> <CAK7LNAQw0KH-yaGTYi7Efy-NpkYuC8qyMfB04pq2DkS6FTQkeg@mail.gmail.com>
In-Reply-To: <CAK7LNAQw0KH-yaGTYi7Efy-NpkYuC8qyMfB04pq2DkS6FTQkeg@mail.gmail.com>
From: Vincent Davis <vince@underview.tech>
Date: Mon, 19 May 2025 20:47:34 -0400
X-Gm-Features: AX0GCFv5_9Sdbxv_y_H48oV8f6CFD9Q6DfVSrStjYF17yYGwz-hD6UR2sVqgA50
Message-ID: <CAPQx_gMjOFnvQUmA=cLTZji3Je4ZiHQ-OMEjaX7uKM=ua0_DpQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Patch can be ignored and dropped.

Believe the original issue has to do with the way I built the SDK.

Thanks,
Vincent

On Tue, May 13, 2025 at 10:39=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Tue, May 13, 2025 at 1:04=E2=80=AFPM Vincent Davis Jr <vince@underview=
.tech> wrote:
> >
> > When running
> >
> > make -C \
> > "${SDKTARGETSYSROOT}/lib/modules/<kernel version>/build" \
> > modules_prepare
>
> This is not the correct way to build an external module.
> Do not run modules_prepare.
>
>
>
>
> > Issue that are encountered include
> >
> > make -f ./Makefile syncconfig
> > make -f ./scripts/Makefile.build obj=3Dscripts/basic
> >    92 | #include <sys/types.h>
> >       |          ^~~~~~~~~~~~~
> > compilation terminated.
> >
> > ld: cannot find Scrt1.o: No such file or directory
> > ld: cannot find crti.o: No such file or directory
> > ld: cannot find crtbeginS.o: No such file or directory
> > ld: cannot find -lgcc: No such file or directory
> > ld: cannot find -lgcc_s: No such file or directory
> > ld: cannot find -lc: No such file or directory
> > ld: cannot find -lgcc: No such file or directory
> > ld: cannot find -lgcc_s: No such file or directory
> > ld: cannot find crtendS.o: No such file or directory
> > ld: cannot find crtn.o: No such file or directory
> >
> > Solved by setting KCFLAGS as the yocto project SDK
> > KCFLAGS is set to --sysroot=3D"${SDKTARGETSYSROOT}".
> >
> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ---
> >  Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 64c514f4bc19..bbe7b0503841 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -459,7 +459,7 @@ HOSTRUSTC =3D rustc
> >  HOSTPKG_CONFIG =3D pkg-config
> >
> >  KBUILD_USERHOSTCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-prototy=
pes \
> > -                        -O2 -fomit-frame-pointer -std=3Dgnu11
> > +                        -O2 -fomit-frame-pointer -std=3Dgnu11 $(KCFLAG=
S)
>
>
> Sorry, I do not understand what you are trying to achieve.
>
> KCFLAGS is meant to specify compiler flags for the kernel-space,
> not userspace host programs.
>
>
>
>
> >  KBUILD_USERCFLAGS  :=3D $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
> >  KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
> >
> > @@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS :=3D -Wall -O2 $(HOST_LFS_CFLAG=
S) $(HOSTCXXFLAGS) \
> >                        -I $(srctree)/scripts/include
> >  KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo =
\
> >                         -Zallow-features=3D $(HOSTRUSTFLAGS)
> > -KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> > +KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAGS)
> >  KBUILD_HOSTLDLIBS   :=3D $(HOST_LFS_LIBS) $(HOSTLDLIBS)
> >  KBUILD_PROCMACROLDFLAGS :=3D $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDF=
LAGS))
> >
> > --
> > 2.43.0
> >
>
>
> --
> Best Regards
> Masahiro Yamada


Return-Path: <linux-kbuild+bounces-1078-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6EF86A7B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Feb 2024 05:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 621471F2518E
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Feb 2024 04:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D57A3205;
	Wed, 28 Feb 2024 04:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jALCk1fa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4810219E1
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Feb 2024 04:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709096218; cv=none; b=uszaSpwhPa44bQoMcf5SOIArc3q+j1dEZcwQH5wDTotY7xcz4Qi7JIyBpLIsPeg28WmB7dszomfiO+d+nYUsHpMKO8u3BpaBxwyDjH8fNKETj56U+SgVUBMwwtvoJ7+W0h5r+T2zulai3xMEVtuard3ElVVxQOyVq70Efmk21VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709096218; c=relaxed/simple;
	bh=Q9q3Ts4D/IDB5UkI6ebI4e+dxkWpOba/wjNuxBVAReY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1fbBpHpJT1FhQKmmJAv6B5DxbNQ/p9MYesDq5lYxCI/xiJFk5RHCUAEaMi2D7aC3p8uQFA+tV16aZ7fceQj+Fu/gnESzWjSt6E36GovIi0C0oIjX2zJsleMpK0PU+kVMDOge4pxUGlfHhTEjuMiwJbwjodt4kzrnYjCQd95IL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jALCk1fa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6de3141f041so3308763b3a.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Feb 2024 20:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709096216; x=1709701016; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4AtewQ0DvpvS+xLs0fKphMHf+bEJv8V+4bZQhjiNKnc=;
        b=jALCk1faNGx8DbpX2jugPmX5rwjO35xXBckMl8vaNkoKXj3EHj57FBJgUanHKHkrwD
         0jXVSmBh3NNAr1Bg0c71gVWB7u6NOOmFKXJqld9xsw2Iu7sPFWXvL6J2aGcST06Ztx0P
         qOZ8v4bXqo5dXic2ARZZPpenKSW4wufYv9EYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709096216; x=1709701016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AtewQ0DvpvS+xLs0fKphMHf+bEJv8V+4bZQhjiNKnc=;
        b=vOIiZYRvAsEHnfRacXOcxC+FvzCJVlfTfAZuOFLTl/vvxgfAwUDi/TZnRwTxXrZwVE
         PAZPBHeOUAKZa6WmYQROIAfR+g6+92U7kr9xM4BpSvtKAU3m2/ZmV42dlum7lBPJjAnz
         DPiThuijiLlIAvuj5G5SbYPXq2BHDlHFTQXzjiaKubNgPGRQdbRpviEtH/muIDn9F/Gl
         o53EWOHUifLeTPb3pLyFvo5piJ09wPc9t1RRDi5l9Zn7NaBrIbAEAyKC98Dgm0GRB5IR
         KCkdCXMxJSHwHy5/B7M3CRvsTzp4nJSG8ytWEHtqi13KHGs9deJjALAGWdlB2wQZdVfL
         CN+g==
X-Gm-Message-State: AOJu0Yy/QVhzZa0zeqjo0kvJnNMFzUyWd0TGvBOlVnbA5dBRbsxI08K5
	38n0bilrTJrZO1nj8DzxOe/Mc8VezPASrcIw68js7IZDTHYeZiV59qUBTJhHMf6UvNgER4c7fa3
	SrA==
X-Google-Smtp-Source: AGHT+IGzy9Vm4PBdNRR6cuhx3TCFLK6OtU4rHrsNcK4rCNijxYrHsK7UABp7QngOCRsXoSJX/xOQLw==
X-Received: by 2002:a05:6a21:1394:b0:1a1:1e8a:4013 with SMTP id oa20-20020a056a21139400b001a11e8a4013mr64387pzb.40.1709096216158;
        Tue, 27 Feb 2024 20:56:56 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:50c1:1ad2:3268:cacd])
        by smtp.gmail.com with ESMTPSA id ha11-20020a17090af3cb00b00299332505d7sm483390pjb.26.2024.02.27.20.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 20:56:55 -0800 (PST)
Date: Wed, 28 Feb 2024 13:56:52 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv2] kconfig: add some Kconfig env variables to make help
Message-ID: <20240228045652.GH11972@google.com>
References: <20240222031801.GG11472@google.com>
 <20240222032559.496127-1-senozhatsky@chromium.org>
 <CAK7LNARo4L6qxoqRU-0dgABarukJKAaZpCRtfA3MyUHhSuDQxQ@mail.gmail.com>
 <20240222051621.GH11472@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222051621.GH11472@google.com>

On (24/02/22 14:16), Sergey Senozhatsky wrote:
> On (24/02/22 13:57), Masahiro Yamada wrote:
> > On Thu, Feb 22, 2024 at 12:26 PM Sergey Senozhatsky
> > <senozhatsky@chromium.org> wrote:
> > >
> > > Add a new section "Configuration environment variables" to
> > > `make help` output in order to make it easier for people to
> > > discover KCONFIG_WERROR, etc.
> > >
> > > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > ---
> > >  scripts/kconfig/Makefile | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > > index ea1bf3b3dbde..0044d49e149c 100644
> > > --- a/scripts/kconfig/Makefile
> > > +++ b/scripts/kconfig/Makefile
> > > @@ -158,6 +158,10 @@ help:
> > >                 if help=$$(grep -m1 '^# Help: ' $(f)); then \
> > >                         printf '  %-25s - %s\n' '$(notdir $(f))' "$${help#*: }"; \
> > >                 fi;)
> > > +       @echo  ''
> > > +       @echo  'Configuration environment variables:'
> > > +       @echo  '  KCONFIG_WERROR                 - Turn some Kconfig warnings into error conditions'
> > > +       @echo  '  KCONFIG_WARN_UNKNOWN_SYMBOLS   - Make Kconfig warn about all unrecognized config symbols'
> > >
> > >  # ===========================================================================
> > >  # object files used by all kconfig flavours
> > > --
> > > 2.44.0.rc0.258.g7320e95886-goog
> > >
> > >
> >
> > Why only two, while Kconfig supports more env variables?
> 
> Right.  I wanted to add only those that we use (and familiar with) for
> starters.  I'm not familiar with things like KCONFIG_PROBABILITY, for
> instance, and not sure how to document it (its Documentation/kbuild/kconfig.rst
> description is pretty lengthy).

Masahiro, any opinion?


Return-Path: <linux-kbuild+bounces-4155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E51D49A14B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 23:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0746A1C221A0
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 21:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574721CB9F0;
	Wed, 16 Oct 2024 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b06pHtOM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A01D175F
	for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2024 21:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729113745; cv=none; b=YHSpNSSGuafaVqFwvPbWGCkeB6zdyF+m8YgnFbVQPDN2PYC2fAGd+TrVLns5un0j8NCP4AphJBAn/8/7xBc1Nw+/jnyB2o0oiRJnTaGys+K8g20lEZrizQYClFj5wgJd/syz8csTL1ADTnUXz2pc0Ku6W/wNXOrbAIZLtlPsePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729113745; c=relaxed/simple;
	bh=OyDiTCgIIBa/GkRKvyHzzrkbUA9z+By1KG3O7d5eMiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrGPsqnki9FbfIPSC5vWXHX8ZXJso81kVqrfsCNrvNrWswogNnQmEWc3T4t8laRMci9BfR/RjI12qop96P5E9IzDA4gckrnqFVyinlYB3QikYaKtC4UU2ztjoGBuXsi2fni7HMFWou67u0wvAvjv02A6RPmdEtIbJCfjZRfFLs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b06pHtOM; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4608dddaa35so92481cf.0
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2024 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729113742; x=1729718542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wkZ4sufrMCkWvTY6u4q4CXshqu7FtbhJxCZflIH3KQ=;
        b=b06pHtOMQM8P0UDfGnbnPHLh/dFOZOtZJ5Rp8PgVMzVVpfaP35TcK2FXHjWREUJ7tA
         mBnYhP6+XneIQn9jgvNcmGgBe/eN+FvJlnq+J9iWxtNqppWugnxot7VIoNwSVyrSk4dr
         JHkx+Je7gfhvxiOX6eKL2cgd4+/3n0oaDKF7iZfYAtjZPx+f7Yy2AH1leyPB2MgNL9W4
         QpsEAe/lDNtPCCte8RxJ+ILNCJFUrPKl9DmMdDdh1+4cm5cyaHRmsf6Lmrxyh1qygr1E
         nftIBXiksh1K1SXiDDH+cQDi4D2khFfUxvRMsdlUGX4Gr1R9kCyruCFeme5KSdcvCPyT
         X93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729113742; x=1729718542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wkZ4sufrMCkWvTY6u4q4CXshqu7FtbhJxCZflIH3KQ=;
        b=QdTmkHWLDIidNOi/GLp0+67ONyoO4C26NXQpzEy2YDG7F1TyZJ53+ZcZ9JJx29MAy+
         AmEFWbS5VtwWD+cCCi5+RJc98Zfgfwy5QaFUbClegdGcgmC2epf80Q8SVNWk32+HMGPJ
         k3KtD2f4IT6iU60Ar8T9u+wdQOdhHt/y4FI8smCJe3jiXkYIFIKS0iuAu3tQlfNACeC2
         XgSzLn0oBHIaKMIko5XGCGY4+mQz8Jgxo8TINJ4ZRetj9ILbipfT3rJXy+DRSj5irt2E
         pG0hmyuiecZYrYzGNX67NjmULpTQ8gxdRIVexl452+/cH5YzTTTYyWQYBMcl8q57QN1b
         WUbA==
X-Forwarded-Encrypted: i=1; AJvYcCXVioMYEi8huq8Z02pMLhs9sCLzjeqMlmtynFJT2C7d3GlhxHDhIZJHUGADOxIFKqB3OFW5vau1EpiVmgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK71+xUy1pjmv1WO8rC2QoArNSQtShkAOqACdj4IcXHqc0EgdI
	c0xh6ufe+ZAw0U4GC2WzKesB7BXhFGFIlwuKwUDpk1QjytvRSqaMPvALnqX1iLvPAwZnh1ZjUhi
	PKPhL6WEsyxGfb3DjoDuWBSAXc7PyQeMpa67b
X-Google-Smtp-Source: AGHT+IErDmtBkSM4h9tKCOEanhS8tMEL2BUmPka/EOw8X38eJd4BfzXBdA4cVWCS8SklYFIBG5mDLRG4jlKSB1gVUX4=
X-Received: by 2002:a05:622a:5f08:b0:460:4a62:4ff3 with SMTP id
 d75a77b69052e-4609f6b45fdmr324641cf.23.1729113742418; Wed, 16 Oct 2024
 14:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-31-samitolvanen@google.com> <f60bf3b2-6e3a-4382-93d1-1eca521e4ebd@suse.com>
In-Reply-To: <f60bf3b2-6e3a-4382-93d1-1eca521e4ebd@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 16 Oct 2024 21:21:43 +0000
Message-ID: <CABCJKue-APgjaWf8pGnYVe3uSBjzApX0FpMUCAHsm56wNSyRVA@mail.gmail.com>
Subject: Re: [PATCH v4 10/19] gendwarfksyms: Limit structure expansion
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Wed, Oct 16, 2024 at 2:16=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 10/8/24 20:38, Sami Tolvanen wrote:
> >       /*
> > -      * These can be emitted for stand-elone assembly code, which mean=
s we
> > +      * These can be emitted for stand-alone assembly code, which mean=
s we
> >        * might run into them in vmlinux.o.
> >        */
> >       process(cache, "unspecified_type");
>
> Nit: This hunk should be folded into patch #9 ("gendwarfksyms: Expand
> structure types").

Oops, I'll fix this in the next version.

> The commit message and the comment in process_type() describe that each
> structure type should be expanded only once per symbol, but that doesn't
> seem to be the case?

Yup, it looks like I messed up the logic here. The ptr_depth check
should be later.

> If I follow correctly, the type_expand() logic on the output eventually
> performs only the first expansion for the CRC calculation. However, it
> looks this process_type() code should do the same, if only to be a bit
> faster. Or did I misunderstand anything how this should work?
>
> I played with the following (applies on the top of the series), which
> matches my understanding of what should happen:

This looks correct to me, and do I like the way you cleaned this up.
I'll apply this to v5. Thanks!

Sami


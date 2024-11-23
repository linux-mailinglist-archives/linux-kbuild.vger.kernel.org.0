Return-Path: <linux-kbuild+bounces-4809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED219D6714
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 02:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9E86B22982
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 01:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D562844C76;
	Sat, 23 Nov 2024 01:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+q2HpI3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30F7B65C
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 01:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732326292; cv=none; b=Psup7hx+OwlLCRR823Pe2ndo7ZpAiESKlM3nWjwkVtIr6cQbaoxFa9pCcPRmK3Yt4RkGYNrk305CcD4g4xCCC4WixXMpwPjN+kV3k+0OR+s/MBzo1U62T/nXju/ixyMbhFc6S3X8ZTD+RJGXJbr5FyxIDLLKmgof3zATlK5ebZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732326292; c=relaxed/simple;
	bh=TJ0g2uv+fOikKVeaJE+ufAGsb288vXYEqQmALJOQXLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcroCZNeyfZ/QSDygo1zyiimUTPMdFLMjtIhzuctF8UIiYAETTevDsotenFAtmkLXM2Kb0zowPGqKIdvs0dcg60PmZHhPyZDxsTKN2X5FVzCNMVoitInC+Sxj/TA6XnLDnm1KXfiOzoRDvbfhpsYfHTd6LltfPpUblFKckXzoVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+q2HpI3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso1759a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2024 17:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732326289; x=1732931089; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S3VAkynSndmVHDi0F0L9SQm1sisxlAWh9z4fRkq2KhY=;
        b=l+q2HpI3rmv14EZhGlpRHtZZ5ocQkNsQDuln++6dvJjNb/HfbnfwDigtcrQA8nVkfV
         qRo2Ix4bP6GLPmlTk9dYdpdqsvecuq1XnzzPaUfI3l5pcyEBVAiwZD5p2F9Tr4BtqQA2
         9HGl0BiiMyOadlC/dlThphN9GVaAdHSDFTUqAXD2ZfVi8DH5nTEBOOwLUjcb2J2RM36h
         s7cjuzQVC2H+U+sw1UfKZIIHglvrby8iJvSfLOZXnNnJEqhYtF4xHoGHTnI5Ad+KAe2D
         ne2agVufHfdjfEUYsj8DhittcXQnRr8uqvhljnudGt0yIX0E0k/4p9/Xhoko4K0/sfGc
         9iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732326289; x=1732931089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3VAkynSndmVHDi0F0L9SQm1sisxlAWh9z4fRkq2KhY=;
        b=iqJu4V9jpCpJNSV234pcBD1+YSNTTxzyiVJG+4T8llnbYlT78Xz4/JVq7/IgMtm1KR
         UWI7BIQoQwPREKl9KB9Hi8rdiD9GDfL5MWbsW687h3a2o8eON4tg5AUOdlSeixTx0Uyz
         Lg5j0jxwo3csdTR9kUsquBJ7+xwiPSGGdZofoIlkOZ9nyHGT/hpyNRe+lMmUTaS9arVc
         JEqAf6sMC68Cm6af/lAV5pky6LdeuSOuPyZk4Gdx0DHLcQN9lMIaaj6HymbUY6/HG3JN
         Oa80W96KB7zFC3Qghj4dwLPjibGK0oVrZBBI3s4Wo0fodfzfx3WmvYA+X2x3RZBrlAZ1
         4U+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhx7mHKFDH8tYNoyMUqtKulUPXESrt4Euy0nrkgcfjuDRlylKUfsQA3edj1Yq8KpHEM8szSXuHTXmC7wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvTSRhgLFBjFisNoJ9116F+EpwZSa/nZH9HEAlKiVhnWU8kjIj
	bgCMk3LTrY8RoRyTMAKLjDny6ww3++1q9JI5xZipLG4t6PCOjzYW8RI1jpxOMbxZvRrU51IMuly
	2JLoq9F2MZcHCCx0FlMNJrq3BO2L3FUuYAQ7l
X-Gm-Gg: ASbGnculuDO5zasGQSLIWaImuPAx2MwNPrbAFNeqMvyQxG7kGFUs6mTMDfKxMgW34M3
	KGZf12Lsn9eBzfG2N3ACsbou1r0863CbnrBtoW/dlVxGce3uGtubBj0AT5EAxraG1
X-Google-Smtp-Source: AGHT+IGL77AC2bNXg1gDSicOAbEhb3ZzKW1ZO63HPbNunVMxHMFLSIMrlQMvQthUYrEvM5iHSpLMrwWh4Y5yA5ldlD0=
X-Received: by 2002:aa7:c249:0:b0:5cf:deaf:ac2 with SMTP id
 4fb4d7f45d1cf-5d035db0d11mr37256a12.2.1732326289218; Fri, 22 Nov 2024
 17:44:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
 <20241123-extended-modversions-v9-3-bc0403f054bf@google.com> <eac20e8d-d08c-4be7-a34f-b511798f0a57@infradead.org>
In-Reply-To: <eac20e8d-d08c-4be7-a34f-b511798f0a57@infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 22 Nov 2024 17:44:37 -0800
Message-ID: <CAGSQo02-o_T7LY4Ld3EyQRyWcuryzw1YSnt=fi6CBiN4NAmYDw@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] modules: Allow extended modversions without basic MODVERSIONS
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >       depends on !COMPILE_TEST
> > +     selects BASIC_MODVERSIONS
>
> tested?  'selects' is not valid.
>

Apologies. Tested before making BASIC_MODVERSIONS default. I've fixed
this locally, and will re-test with the whole stack before resending.


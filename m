Return-Path: <linux-kbuild+bounces-3533-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F667977419
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 00:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F1ED1C24159
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 22:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571E31C1AC8;
	Thu, 12 Sep 2024 22:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq+WSJ4B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0F4192D89;
	Thu, 12 Sep 2024 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726178914; cv=none; b=TdaXLtL+xqP5Z8Ak6TCmllTPY7GLZs84cxeXccZ6IRO7VnGMf80Lh7pJ6DWgPMWfVJF3O44A93eL81dCdmDgU0Ms77Swj7/x1mFftnqjf8l91Ee1Hvkwrl9iJxgrhrCqu75kmRaT+3Zw2YP/BVTRPdLQsoDIL2vo65mnv3p1Eh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726178914; c=relaxed/simple;
	bh=/2YLoM8QgDHNOaLNzKK8v/KNYvua5uBzCv9i1eFPyFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBd4iZCWUX7ohsISRXvkULOcH01ofVo+u+gDNLxXaQf9NiBe6TKn+4r4neHDBf/yphFhhWTD+Ormu6xqmRFRaCesNVEdtoij3bAbRU7Q2iiwHHvUhA/CQDtZMWkUi/QDDesbPk3ynL2AKCkY7d1+bV7NLpTlJQzZUgx+COWHHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq+WSJ4B; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d871bd95ffso227219a91.2;
        Thu, 12 Sep 2024 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726178912; x=1726783712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2YLoM8QgDHNOaLNzKK8v/KNYvua5uBzCv9i1eFPyFY=;
        b=Oq+WSJ4BvWt7Q5lwsboI0cufYTLEl/bG23DZcwZQlYmm8RE8jccRG/xUXFc6I8PaS9
         kBRN0S8lYKDkUgzNM97WoPsOhlvKEpGZBZJ1vmlsIoJ3660mpMXOP5TptYNWgBLEgJtX
         UocvF6+7Bd2dcZHW/MTbUA7hzInaRuP2WA8PDPy+xfqnaQpzBvzuf1k3CLNvdVAZcIlJ
         eHH+VbOWhQSglVWXPBRyrlaEhiaB4Fncut7x4zHLPacSsLDXFqPbvmUwxce/qOPkp5rz
         zfXZIQGBYIXFiTRtcDsc0oGDsiDLOZmQxaHF1i/qoa8X/RU8fgF5D4Mg04vVhTcAcfAv
         LV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726178912; x=1726783712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2YLoM8QgDHNOaLNzKK8v/KNYvua5uBzCv9i1eFPyFY=;
        b=UCZAYKs2FZUd2rg6OJJ1eOK64BqLQP/S43oNH1kLE3hbl3CGUjS5cebH5i26SeBnsQ
         5us3AiomI1wn7hpL5hewfWtsQyuWT4OGEsF4gHyiUsLOXKH8yv2k5rGLr1qA+YFTU2xk
         wNuFZFnRzXmbb7PaNg+RoOMLMKG6ZBe+/KfB08hj9T1+ZASDaNCtVa/PHKLXl++wTkqf
         +YFRv60+pzyLjfqOG9i+gV3/Y7vkK5zZiPo9ACjq0i7/5yYRus5HLT8CdOIfyDtepSvJ
         aSpHpcRdoxAl4BQws8YvMVc0fj0LOAtfsJ7hWtqvagBOAAODWDGLvTHcmJwpH+xpKEDF
         htuw==
X-Forwarded-Encrypted: i=1; AJvYcCVNREeu0RzIfrNoTX29Al/SLKdjikAxlB2IMQLOrmBz0l6QK4nZYDyxzTS11WUHGq+ribrR9GJ3bKlGEU70DFg=@vger.kernel.org, AJvYcCXHVx6940fyH7X2mMl7RRSmoGLJlrzkQgrcEXD25Anq6wnfWbjS2XV0wbQn6xJjUww7wBV5/6UBB2MnvjLx@vger.kernel.org, AJvYcCXbQorcoTNdMobBXjU2NSnjcnQ7TuJ/P+YTq9KPMtvlDeyuH/oQSmZssurbR6HrBKK+oiiG5Rk8bSGG0Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMkEdXwZoQbCVP+O3jauzEJsDZmcIg7xJiwrzEJicgXSBCmiDO
	qniIfKV2YBQoxeL4F0hlVp4xvNkKI4skDXMWIiPUU5g/6EhbreG/14vVQ+Pjfh6Sb7IW6Xb9ebH
	6UqouYOH17+hdk+fUsVKwvlv2edo=
X-Google-Smtp-Source: AGHT+IG6aej/NB5LBMrn83sRcBRKI2TpgN93fxt/vJJgonNH0ivdw+rd6rheCsWsaNjoH5e3gvokg2/fm6nDqHPOGEI=
X-Received: by 2002:a17:90a:d791:b0:2da:71f8:7ff with SMTP id
 98e67ed59e1d1-2dba005b46amr2003435a91.5.1726178912177; Thu, 12 Sep 2024
 15:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
In-Reply-To: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Sep 2024 00:08:20 +0200
Message-ID: <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 10:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Add all of the flags that are needed to support the shadow call stack
> (SCS) sanitizer with Rust, and updates Kconfig to allow only
> configurations that work.

Applied to `rust-next` -- thanks everyone!

Paul/Palmer/Albert/RISC-V: I think you were not Cc'd (at least in this
version?), so please shout if you have a problem with this.

[ Fixed indentation using spaces. - Miguel ]

Cheers,
Miguel


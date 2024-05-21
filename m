Return-Path: <linux-kbuild+bounces-1909-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 874698CA99A
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 10:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 286B41F21ECD
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 08:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57B0537FB;
	Tue, 21 May 2024 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyjLUVUn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF764CE04;
	Tue, 21 May 2024 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716278730; cv=none; b=cEyUbtwVcd1H+EXRZPMa0nTisMp9+6wf6BVYdvtHPncOUk6lBpKpwjattZjErodvDVszmXM8eR4o1M5gk2fs7/owckQlj1wtAtXdty8jA5aIiJDzkzAAf9QhwqTNLKFcJScvn20MCJhFwEMg1Rb9iFpCw+y5BRW94sBHIGFpIL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716278730; c=relaxed/simple;
	bh=5LQIN76LGk6Do2fSAu4Q5mVj5ZWkrdbmP+HHXF42gLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUh/G6cMxw4q0LvSNv4g7Guls5TCCckUNFpigeHoL6SapEnX4QGmuI+a+iSfzCXfxis+zI7OCmcglO2s9cLUVmlnQrrVOCFYpVPmzCNl9vwPRq4BDoORKcmzpOyRNxp3LQGmUR1dnOwroiUD0sXa+8CrT1MPZ89wRz6806gnVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyjLUVUn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ec486198b6so92962565ad.1;
        Tue, 21 May 2024 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716278728; x=1716883528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LQIN76LGk6Do2fSAu4Q5mVj5ZWkrdbmP+HHXF42gLc=;
        b=eyjLUVUntnJvy2+sxdkI29LVMSmA47K15QwAdi1QtJPxedW3dxVQVt0NRu2DqzGEF1
         k3jCz1RYbPicd7QnamypesEzn1lbgv4DGzc9PSUhkWLGYmLOI9EumEjmAt7eNMq9cfoO
         mdSoWIKThJXooqeAhsacdTogZGurxfLvuMBA4OoBKmWrIlvdrVWsSi16SgVI1vxEqs8Y
         luO5NMvpupCCFfnizcywAlhwvTxRXb5P2w2Vac4eEXASd3tHpWsZQt7KRgyhdfO6m/dp
         WARuqTvGHb2YZ2jv1gE7h45gUnts5lRPpGGTuuzg1/czvcrTncFONM2qxqqzAg+Eg//p
         z87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716278728; x=1716883528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LQIN76LGk6Do2fSAu4Q5mVj5ZWkrdbmP+HHXF42gLc=;
        b=Mtw2CviWO/GXVSepXAv4mGG4U5vK+ZjCC9J2yl4skLUcEg9MzsBciaj36hkyhjAxdz
         5JJqNEiRJQtLeFw4baUONNBGyi9ieiqsXnQFWUOuhpTDlQwdpP2SLG7SrBU7jGv1xFOR
         m7t8dqG/6vO+T9I+XQuu7ic6dyAt2OTYeMYHYA1DPUoxKTnGIcI5N/CX9dj7w6rz1LWP
         qT2AiFGA26P9Po/nMKOXlZMqSuWNiuAmifZPborMA3wRZ9kyBYMAAgS3M+7cU4BBBKy9
         FIH9p8KvfNeL1CzTlRkvp24OmbSVxQlmzg5/lLpNnZSkdN1M74mQojqCujlSf5KhN6Gc
         01Ng==
X-Forwarded-Encrypted: i=1; AJvYcCX82o8ZyFdbwxcLKfHRroSdL4gCrJBhqz7Sr1ucQU2GGfEDTRHveuDa9nRG/8DN/HBON5jdEjMvy3ADMIZ8axeXZvdxlzUHQQPKvNxu361gBf8oV0ayglW/fxn7W/IP1FVNuZ8dHg/K8wVq0WeOa6BUY1zqqNU4razehq+CoR4EJoWFEWjuJ0td4IM=
X-Gm-Message-State: AOJu0YxNMjhO4i+yj7DTrDdDXu2w3VFLYPvv0zQB/NycXTpG8onE6rKz
	8I5HhlXUK9avn+4uqu+tp8oBEYZGKFRKzfKHOOWDXWPEkyDdBo44d6MFL8UK2lJm7UXQb6rqCSO
	FKM4lnUFCtuqqiAFpLU6/98m0H9g=
X-Google-Smtp-Source: AGHT+IGbNuVDfS2/nNPcPvcGmN5RBzUfnDNopwneysKedo3ubG5AEFhMAOmNVByi64q15tTgCTzcyTQeLmmpXz4BNV4=
X-Received: by 2002:a17:90a:ca8b:b0:2bd:6f2e:8c1a with SMTP id
 98e67ed59e1d1-2bd6f2e91b7mr5738211a91.2.1716278728508; Tue, 21 May 2024
 01:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-2-ojeda@kernel.org>
 <CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com>
In-Reply-To: <CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 May 2024 10:05:16 +0200
Message-ID: <CANiq72mcdtNie=t=HHhZnjQa7gQiDZin+TYP_7Rgi4kL83H2BA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 6:15=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Rust started to do something different from C.
>
> KBUILD_HOSTCFLAGS is not affected by any CONFIG option.
>
> The reason is because HOSTCC is needed for building Kconfig.
> If the flags for HOSTCC is changed by a CONFIG option,
> it would be a chicken-egg problem.
> Also, some host programs might be compiled even
> without .config at all. (e.g. scripts/unifdef)
>
> I know Rust will not become a part of the core infrastructure
> of the build system, but IMHO, host programs should not be
> affected by any CONFIG option.
>
> I do not like this patch.

Thanks Masahiro -- yeah, I can see how it makes sense for C host
programs, and consistency with those may be best, even if it is not
used for core infrastructure in the case of Rust.

Do you think it would be OK if we do it only for everything else, i.e.
no host programs? That covers most of the Rust things so far and would
have helped with the warning I linked above (which is why I would like
to change this -- one can pass the flag manually, of course, but
having more targets affected by `CONFIG_WERROR` means more developers
will have it enabled and thus notice earlier).

(I am also thinking whether it could make sense to eventually
explicitly mark the C host programs that would be exempt from
`CONFIG_WERROR` so that we could apply it to everything else -- I
guess it could be easy to get wrong and/or forget when new ones are
added.)

Cheers,
Miguel


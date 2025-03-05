Return-Path: <linux-kbuild+bounces-5968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4B1A4FF03
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 13:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF6223AD105
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 12:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82930245026;
	Wed,  5 Mar 2025 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg8wuBkt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C74222331E;
	Wed,  5 Mar 2025 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179051; cv=none; b=rQnvRxZEbRCpDA5q/g8EJBvM3f8WjxlsXDxFkNuewejL1sLmcOcTfF3y1UY5Hqcc1hd6UeXg1koQZcgdMRrWz63y8rLP16B4TAuZV6r6PgmWTuCbQBENRuOfmW2D+KyHGp5Fv2q26WvBJa5uT8hyc5fj4MnvoYmKBvClyysCx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179051; c=relaxed/simple;
	bh=KS/nMxrmk/VoiPOhbUA18X3YSQ1EZLW7PZG62P/CtPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usXEp6K24wSV7VhJgpPCVk8PRb2gp34LUmVgMgKY5nkZEdnZAr57obl6Sf2M2q71aywhjyoU7yU40BpiuzWE2GN/PHqIoKQyhHtPZQU7DHAq4y9N1BQ59PyfUvqLeFhfQLCc/rHTc1Mh4BQkz2/zNKB3bk7hKNFAtVFQIfAt7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg8wuBkt; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so76273a91.1;
        Wed, 05 Mar 2025 04:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741179049; x=1741783849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS/nMxrmk/VoiPOhbUA18X3YSQ1EZLW7PZG62P/CtPs=;
        b=Jg8wuBktvEbgirDm6Y0itpiPJk2x6MpXusWfM3IvOhNd21zr6Zd6oy10DfCcabOy0m
         vJGO3ABYrSMhpSYo3Ifa6VCWkXs2eQ21W2TlIIp7nYRVsg5ckwa4eCtdEm8tY2+FwAsg
         UuyBDUAC3k2QFX6/S9s0g6PfUXxUMrFdHH9GoZaZ7FzsObqOywP1zBnhfC4Wjqz4xZ9c
         dlhykDdRWl4IKs8IuKnkXkPpaQpvRddmcPxdYIRh61mcwQMOQV/RWt+ja0Rphdyi2fIh
         gVxZ73Z//P+oC90IgF/tVQWEl9frwCb8C+SmNl/ueTxSoJXL7inNQgiIFS2o3cGuZmMS
         Xpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741179049; x=1741783849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KS/nMxrmk/VoiPOhbUA18X3YSQ1EZLW7PZG62P/CtPs=;
        b=MwtjiAWcTBXxAoDs/ZzCy6vmm/M/EgDvad/tzFHjhGSBcbijRGG2lG4SITUfHkko6J
         yVEJGGthT/qGKl7NT4UvDcJd8Hjo7Uvm5UifvLgan21MSdCtX8962tJH8P9/Bb09MhKu
         MKx7uiWhDJEYG8LGWET8cAEqJrZQ090UojPC4wPE3w4+9nolBsp1GDBg5/E5C64BPKuH
         8TrldWl1jXShjSJcsWvY8jZudfKXdFeqAC74BAuAdZMA5WwUIXReME4AGEc/8OwYG5U5
         jfoaRz+R8xeyAMGny+YDDWzEDhJ21PsJT9nFjD1Kc3WHP+4IFOBohOE1Y3vPl7jCPqe0
         6D3w==
X-Forwarded-Encrypted: i=1; AJvYcCVzP0p4goPHlEmIbjapJKWX1jBs8KMYh6R6VDFunt1rfhoZBr0+pddEmaLs8IIHNqIt2vWcR82dS+sYHEwt@vger.kernel.org, AJvYcCXCYDv3G1jwlks3IwzmZR/88TX54URsM7svpXHfcMHHdbn0cJnvFR5yNYz61USA/XOoYwBGUbwmZOD1MJ0=@vger.kernel.org, AJvYcCXWUG0UA0p3thcSnK69cbtZvJXfVUTBGj+pVV8K/BZxrVidrwv0YaUy1QYN2nhUepmH7dUNsKGB2YX24THzEsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpn45q8uhx/yUA6bSjOkiBNKrdx2w9mTh61aM4WbSb5zPXDbU
	/4CUsG9T/Svbg+6boZdO1nyhALJIYdv0Ka39DKyGOYYJaGmNwZJKIxqjxxYPdVdSOC3rLYH/UbK
	cXtOBEqgX4KDhljIEcqHfeRODdlo=
X-Gm-Gg: ASbGncs9davM9tl4op5SXmkcDyJjyGA9wlJSD9OsY69Mv9Oiaou82s/ykoSOb+GIK01
	fofe1RRDs5djk+LtjK3x1wH7o+Sv94HDNGSuwdZtnxuFcJYdObgaIDcR3l1dxvVREIzy5H/0yFx
	+aFgOaSPQhWH22bkdupoL3sK4PdQ==
X-Google-Smtp-Source: AGHT+IHRYhSBigTQnSCWsxxtOWyt5QvwfNS9Um+UQju1He+7NOP4G0yX3dMg/N0huP380TVIlYCgfsZSf8AgRjVOVQE=
X-Received: by 2002:a17:90b:4b4e:b0:2fc:25b3:6a91 with SMTP id
 98e67ed59e1d1-2ff497c18e3mr2053905a91.5.1741179049276; Wed, 05 Mar 2025
 04:50:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304225245.2033120-1-benno.lossin@proton.me>
 <jpQp16UCJ00pInqOI-QFULU6-FKl2bBtAlmnxtXWLgXPVb7gy6d727nr7THeyks3ERF5Yqu3R6bikD0OK4mqXA==@protonmail.internalid>
 <20250304225245.2033120-15-benno.lossin@proton.me> <87h647d6xg.fsf@kernel.org>
 <cdfBMmuIl8Wl-KpI-koNDQJOCGBr9z9dOi5fxQvFbgNWQHHw6JtMizaMMbMniNlE841-9b7TdLuZ9Xh_hFsf7w==@protonmail.internalid>
 <D88BLHENDH8Y.HQUKEXN1XB7C@proton.me> <87ldtjbqw2.fsf@kernel.org>
In-Reply-To: <87ldtjbqw2.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Mar 2025 13:50:36 +0100
X-Gm-Features: AQ5f1Jr9nSKXiMrs6SJeCd5cl-7WJAHP5dzWDzro2Yskx4atmx7fvgz0wS9JWBc
Message-ID: <CANiq72k=KiYhKr9XHU38==Rx0df4rERyOL1abRG_cDo+4NNa0g@mail.gmail.com>
Subject: Re: [PATCH 14/22] rust: add pin-init crate build infrastructure
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> I _really_ think that the ability to run the tests should be present in
> the kernel repository. But I also do not want to block this series on it,
> if it is something that will be easier to achieve with the build system
> overhaul that is in the pipeline.

No, that is not the plan. Even with the new build system, this is
supposed to be developed upstream as far as I understand, so you will
need to run them there anyway.

Unless there is a reason we could catch more bugs here, that is.

Cheers,
Miguel


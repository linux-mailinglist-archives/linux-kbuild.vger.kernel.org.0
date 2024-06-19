Return-Path: <linux-kbuild+bounces-2222-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB390EB19
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 14:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 547CD1F21116
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 12:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FAD14388C;
	Wed, 19 Jun 2024 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpovdgUI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFBD14372C;
	Wed, 19 Jun 2024 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718799949; cv=none; b=kMf9nMlAvRVruZp7wj8Oe8FX0fASTsdJ3KtbUcGS5TYMUB7KCLaCrIg74Da6UdmIJBjVVk7Rq436DTTeudFOO9dloN+rUzSEfZOt7VYRsxM6sjOiomctI3w1jKmjCW9R5E3FgVPm85Pa3XWWaFtqFVtkpxYCMK9Sam51Qft5KZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718799949; c=relaxed/simple;
	bh=dN3aur1KLnPivjvSKROXe0S3T+bzDuyLcnyHlAEifBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHIQwKHv7M1fYt0BSYNYHPLWBCkwdyHfeDPO936rNUBHH37MivBBVuxryNwqnZBxMBpSsISdWnyxg37Rb5zA+pQ7CU82c19Cit1tNsigrNbrmjthMzDhDH575UnNHYVzu+cqL5Bq29M6ByBDlm9UFSFnwa3FrSlZDzWAfCPeENo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpovdgUI; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e4e6230f42so615565a12.0;
        Wed, 19 Jun 2024 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718799948; x=1719404748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jzy0cfJzj3KP9+v6dQql4rxY9bjF/2HHnFqVEcifsp0=;
        b=SpovdgUIWupw7dW65CB52JF4QYg2S4VJp9nV1B4oxEnFJHKTWc8zE0le2SCcGh4BNe
         HTJrCkNq+ou9UXAkNwS/L6SkWeDvKBEl1uhKE0rlmgmYNs/MHce2SVLTfzu2tiexc+W4
         kcEoa2rWKbvB2vspMQFyhUsMMkWS5Y26ag5/9/oD/7yXytKzg652CzT2FO0AJw1BiBHe
         jww6UnjHBrdrJ/rj0H9cakg/A/TTOwP1Kf2ks0P93zS4gqjw/1RfMTd0du0kCkydD8S0
         6ctX0rIwmB2XLpqkNE3DC/7kBGVBrw1jzU4mS5IqzdQhcGPCJADu1HN+lIN+ugFFtBaX
         seaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718799948; x=1719404748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jzy0cfJzj3KP9+v6dQql4rxY9bjF/2HHnFqVEcifsp0=;
        b=bgYN0iuinZIKxIFp0tdadZiCo9IRQbNRk8JGadj9m8bYeW0sqjP/Cfy5gh2Z0bG9Qm
         WPjUnO2dDF3j/1UrlehGToEZHUoRpO41PxK5Sf0Y19w4qW4s+9yb3Q1CzIwFNP4U4Nb7
         TnuaF8Ww3qysYgi3sACCIWOjgv4z6Dsd+m8JFbxcJYspqCFLrCS8S2LgUtOs9LX7xXxy
         wHvDQ8shTEVU9IC5WMoOwTSf8CkxKAtXlUv6eooANeczGcXDh6feykAAQfw5XSdevtWL
         aaxeAcBkkQ6g1fSAGQe0dxzxPo3x0CU3kVvIkSdc+95auH5V0OkZPWLQO1QTfvRiXX5Y
         fvPA==
X-Forwarded-Encrypted: i=1; AJvYcCW+xk6+fawEn+V8tVhZzEAARZLZhMvp0AuTFSBD8Acw+NGhzi7yREiU3akWDW+FaXXXyzt4o6e9zDS+lT39Szx0N+AxgqIeVcUqX4cdccNkpRAXv5cob4c0E47CsdKTT2QdCJWvURGd5O3onh3L/c+BryKyheVDbRAyq0JTVuX7uXuaeOTs1hYhxno=
X-Gm-Message-State: AOJu0YxEMO/ebX2d704wjWAL/lFnfl7eUAD64cxcm5mdZ1DV0AkqolKi
	v1jXDyRfKsfggoxRa7OFBxpM+7YPbyjHa9MtXQXGkoehu5bOgHHKQtS8NUfx1OXJbAXcuu9f8Ly
	wII1cIyl5fl9QGfNrsRn3o24koZLBz1Jz
X-Google-Smtp-Source: AGHT+IGau7w6zV4zA/rc/ld1ZTMOlwqdo4YNxj0NewfHBWxljs3K+qmgtk5S5kMADXNIorVJfypa+bKxBOYPbIUEiq4=
X-Received: by 2002:a17:90a:8cf:b0:2c7:b392:8f02 with SMTP id
 98e67ed59e1d1-2c7b3928fbemr3645967a91.23.1718799947634; Wed, 19 Jun 2024
 05:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240601004856.206682-1-jhubbard@nvidia.com>
In-Reply-To: <20240601004856.206682-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Jun 2024 14:25:35 +0200
Message-ID: <CANiq72m46gN4GkfeXgykEar6OVa56ck9FmWQComd+iuf61FVSw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: rust-analyzer target: better error handling and comments
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 1, 2024 at 2:49=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
>     Rust is not available

Maybe we should use the `***` notation that is used elsewhere?

> 2) As long as I'm there, also add some documentation about what
> rust-analyzer provides.

Perhaps this could go in a separate patch.

But those are nits -- if Masahiro is OK with this approach:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Happy to take it too.

Cheers,
Miguel


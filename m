Return-Path: <linux-kbuild+bounces-2281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249191BA77
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 10:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA8792825F8
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C37C14D702;
	Fri, 28 Jun 2024 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sDERvh/6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC1D14A609
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Jun 2024 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564938; cv=none; b=Y29M6ojTOoOlvehEVCVgJ57v8aXWuZSYyc4ggXz9y9/L25T4kvTvTKPKx/85XQv3HGJn2BvnqmpCgVPTzcWPMyQ7HvProHjEkZ5t2JncIU70bIYvUjY9ERrNiF6E8ZjUDvsqbJD0eqBURtkPEc/x3SNuMTV9HdT4e4uPfCfXO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564938; c=relaxed/simple;
	bh=qNT24P69oZExcdybuxkfRZexZp2GF5cn+DnHmLdaWTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYUvkH5VmYy+SpXSiTH59MNXGxBulgmuocmUevDlwFx2opwtW0Lrf13QoWUfC9e3B0tX2sIiMYwGHnyz/QWQBBSKQae+zuyWyuaxNTnRXFc6CxQO6RRAIuiaA/x0eaAUgZNPxK8LZClZFr5cDS95bfY/svp/JIxIbVjEeysV/KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sDERvh/6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so258474f8f.1
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jun 2024 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719564934; x=1720169734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNT24P69oZExcdybuxkfRZexZp2GF5cn+DnHmLdaWTw=;
        b=sDERvh/6LV89l7xKiPO8KcN5+doDSnLjYn+9F8AwvWIoprno4NYEAB9QLRGvi7JYpM
         7L/u2qHCGSnFiMlWhl04GbkOAG9wTbdDLlx1mJMEzL68mRAKFkY39wpd1rhNDSucSIjI
         3wuI07c4DVxuFECRHFyfed6V2ZVL3KxambDzMo1o3R3tw/glrEY74qZloXAoyYgyJlMN
         NyvFX4ZWPQZqUohcZG7i+IS7ALZnZ8y5CxGosWN59WbIgSMUfa8D/KBQRRBf3DKKAcTK
         ETdJBcUxQ2w0Y9UFG58KSRneWI1XN6JBAxzHly4bcAX7ba6nAK2+LymeEHhXSzE0uSV8
         cQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719564934; x=1720169734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNT24P69oZExcdybuxkfRZexZp2GF5cn+DnHmLdaWTw=;
        b=aHvUtYJCfOiDQUYu4HiXPemp3+qmh1iiLwrpXV1u+koFIuMD88DtQUZOz4eY83WBY6
         HTtaTDvkwGJyrvNXzXdsvmcuP4rn4nBm4IIjpBTPeS2oW8C2A9wxonxO8Gu7ytjCBvH4
         cfZLEX4/CrFGs8q9qkZeI2yBCUOO/tp9I+eHVg7qB95xeNwkW0beLTCE4HhdYG/9X/20
         hWpVxxMdM5oMy4F2t5xHiF3kZzxl88K4AIlniLnz8G4kfLnq0Oeb5whlUz4hCW68pJ54
         +/7JQi1l3BAwCfebx8+tgfQ10uLPY/ctmjLtYgRlzHNR0/Kh1v43/wsAkQPyWl/6FxTa
         k3QA==
X-Forwarded-Encrypted: i=1; AJvYcCVrDCxskWEbRjObh1JzvE6QsTaS2z+rfCfc0c1kLd82nsfl7aXMkMu93vRo74j9nvv3+1GE+Cex1vvKX186YzXenSYH0QWnVhftW+GZ
X-Gm-Message-State: AOJu0YwtcWtsWst1UbUhvrE+p0yPnag84eSKkMQy1aBUGUJ5UD3AHtgx
	ERxKnFu3yg6nGsbRuMNdhD9R7hg/pphwJ5wnVF91hZfN+bslzh5nqUS/RTf0z0uDD2UGKkHRbdE
	HnQY+LlhH2c3UCS73FZB70HJyEVIW4dXjtL0a
X-Google-Smtp-Source: AGHT+IFEk7Cod2Hp9SvJIIWpoKIKJrvmi1ZmyTwUyea0Fir04rTr9IxaSmMdVqorrv7lReztOBBKgFNhP71zEk8/XfA=
X-Received: by 2002:a05:6000:ac4:b0:362:c237:5569 with SMTP id
 ffacd0b85a97d-366e94d8815mr9649639f8f.2.1719564934113; Fri, 28 Jun 2024
 01:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628004356.1384486-1-jhubbard@nvidia.com> <20240628004356.1384486-3-jhubbard@nvidia.com>
In-Reply-To: <20240628004356.1384486-3-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Jun 2024 10:55:20 +0200
Message-ID: <CAH5fLgjxd+nT4MzgY_DBj8STffAFETaqJZXjMP-_Zw5tqkbz=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Makefile: improve comment documentation for the
 rust-analyzer target
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Finn Behrens <me@kloenk.dev>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 2:44=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Replace the cryptic phrase ("IDE support targets") that initially
> appears to be about how to support old hard drives, with a few sentences
> that explain what "make rust-analyzer" provides.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Finn Behrens <me@kloenk.dev>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>


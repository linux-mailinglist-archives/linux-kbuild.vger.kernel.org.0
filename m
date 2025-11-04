Return-Path: <linux-kbuild+bounces-9398-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF375C317E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 15:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49EA446378C
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 14:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB491305942;
	Tue,  4 Nov 2025 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+f3rsGm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59222B8CB
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Nov 2025 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265820; cv=none; b=qZk1ythE00d4F2BceZAHCSNDlYFacybOTxn/2KcNqh/d/mMzfZbieOq1t9c/grCtK+YtW/9jNSmS0SmChNb2pW13BLUQI5ViacR5qHMQFULPjnlNCam1M8vny1suVb8YpzAWHkxFEx0cpgkZzCyVYBqFmeoyagg+eaNfU+Astm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265820; c=relaxed/simple;
	bh=Sh+MaVFRymsuv3mSiTuiE0T9KT+Pic0tQtQqdA3cTLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtIvSd1mNSCqS89mxm8dlEs4XLnQVHsS8Mt3uzNZ1YDxKoFV0g2TANIBa50XZdve1NKwlWPQl0gV98BVDkTYT6g7nb5t9CKlJOfA9t/Zi3qehxdNYPXchsia0iJwu0KRQ71e7av+xU/HFld8Cj3kXfnDHTydL+tct2lWhqyFBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+f3rsGm; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ba3b6f1df66so40616a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Nov 2025 06:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762265818; x=1762870618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh+MaVFRymsuv3mSiTuiE0T9KT+Pic0tQtQqdA3cTLE=;
        b=V+f3rsGmCpVM6N+1Uk3gWTFQv1luplnuwnMk0e3qAaggMF9Lq2zI1Mp+O0V7wDEXzW
         iEi2LW4ot3Es6BzZOYABq5bGzVzAi7XNVg7KzkPgxjf/jK0fPVtcBPv06feELQgAW/K1
         s8U03S8FrECv6hdAP0O6c/sthNKyzuzKH+XR+cudDcgcj/gnnNg1dkSLuXi5rT5pWsbF
         E6NxxA2/BqRbGf2wDq+JEwSIZvWgPQldd9pzYSIYlaNLuzNUUIR7dUh6oKtuz3PUr+jY
         qJCriutJMgIdmgLfCBSycQ/5Ph6iaBs0rVjMhB5HYR1bQnMv/FudoXsQkQ6KS4oIIqNZ
         9Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265818; x=1762870618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sh+MaVFRymsuv3mSiTuiE0T9KT+Pic0tQtQqdA3cTLE=;
        b=qinY9Hcrioo458U9m5ZoJ6jRX9Bck2JQom6LZ2C41Ja0WTga/kaO5pzlZggu2+rXCn
         xKYBNX4EUnu0BvZtnxw/Zz48d7NNqnAkaD0R+ommnlBBmVTLPw4A3fMF335U9BHTQPj3
         HyQPRuqZ9iMa/d9sLccDplCkvLz/rEbOHXr5dQLRPnxLgp3SV5+RNwpnMoRpolB4fO16
         RSdjMK4GUF3h4HGYePmjdmUVmeCLWIW2t2+cv9te0z/Hma9HF9q5oEt3qsqSlCCEFWi3
         x1n9ZdHdav3brJCk0/iBpvBvI13PdFPQQE3HeeKwws1PyM9PVfI3IRPV37m+2FIcwZG5
         CaGg==
X-Forwarded-Encrypted: i=1; AJvYcCW6bDyOHvL//b02FR7DadpUq/F/qzwGhZCoS1a9wi6ruXrYqV85auKAGVIgrWFgCVH7XOzR//xzuUUHnL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIvdlAjqHElhCYgaSXf/OaspGjDRhTELRwUQxoGGyjwI+kU78p
	JfluNJg2gvSEuZCxXZKIsolVx2z8VVxisabyPUxtHggANqjeeVD8OhvZhgDwqVepvSCu5Il2FvN
	KVlM9jQTHZA9cJ3AkTYXU5Ez8AvBEnIc=
X-Gm-Gg: ASbGncv08YuN4ttk6Z+gSFWHIBE4XlcKmCybkN/USoD2dk9pQpWR0IVpwWbMJcGzxL0
	40OSdz5Y/hFn48dGysDqsQ4Atg6bDAQA28GLAuN44I0XktM2cV1h0f6Wv+NY+LcbQweJI+i4jxX
	GvZ2Akk7ab5SPreaHpax1bUDl78uFO+BC++CxmttBmC/8pg6OLNimWLBLLKeStIjTOZ4RMzMALR
	0fp/OdxeaCJuHn6tX6iNAy+KW0/FQ2xt1/YKaygQlVW81OqBNTMZ+PqIkZz3D7XBNKgSbYwIfX5
	f+i2WxtvMTyLhdNfTLyHrC8y0DeOvVl+j4rMLiTA1Az7MOh4CQEAwOz7g5na6Avn9gFWUQ6ery1
	YwOo=
X-Google-Smtp-Source: AGHT+IFPcCygCFpwJxAi7tzB27/U0llI6K77VjAmQGkHNUGN3whlkaQCTTO+EohRDUTXs16aDzzs2MUAPc6YS382IJc=
X-Received: by 2002:a05:6a20:9143:b0:34e:e7c0:3aaa with SMTP id
 adf61e73a8af0-34ee7c03ef1mr858167637.4.1762265818351; Tue, 04 Nov 2025
 06:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com> <aQoJUAdFFBpQiEZU@google.com>
In-Reply-To: <aQoJUAdFFBpQiEZU@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 15:16:45 +0100
X-Gm-Features: AWmQ_blfMcKn6WraSG1MbO5QBQX_DLZkGFH6c-b4AqmylsWifqNf6lbYrNe6YOQ
Message-ID: <CANiq72=ueGrFG-pj+4snGnbrT-AW16_gMAUHn=3pVCE5JX8gRg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: enable slice_flatten feature and provide it
 through an extension trait
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 3:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> You should double-check, but I don't think you need to list it here
> because all uses of the unstable method are under the `rust/` directory.

Yeah, having the indirection and no macros expanding it, it should not
be needed.

It doesn't matter much, since it is stable anyway, but removing it
would at least help other crates not using the indirection by mistake.

Cheers,
Miguel


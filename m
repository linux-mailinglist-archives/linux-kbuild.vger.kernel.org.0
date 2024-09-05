Return-Path: <linux-kbuild+bounces-3411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D596E457
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 22:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B50E1F26BE7
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 20:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547EC1917C9;
	Thu,  5 Sep 2024 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSxwKa6b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258C17839C;
	Thu,  5 Sep 2024 20:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569250; cv=none; b=tZ8te/QyjbdLrVRXDSPNisM4uq7JVf7mTfEXS+DMk5W+8sIG3TKQWa4PmJxziFIpi6mAizhECZCPpIDWEzQ9H1RybdcEwn0m/MPTlrEjxUjrSUxb1lryTrVPyYTQ4za1kYeeMGjJVLO5i6AWPTlw3cDOy75/awpqH/gvOp6W5l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569250; c=relaxed/simple;
	bh=4Hf3O01u3Ljb1Ba2rss1ItqwhVifdhOzdjDqnEMWUE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bo1rtq8CbmnJb3cCsGzOWiMck3Yn6tQcqQmzhiTvNq4DnSTK0oMzbKLL2/P340ROiSkQFVjW2KMeBS1tED4QToaWB5EC3LrfVzD9LOwLly2FNKoclGEUAgECsgeC2yuAwSBVJL/bQUu5Apk1rkL7SKbSyMEdrfl1/RIG5MjVA7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSxwKa6b; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718d5058819so7687b3a.3;
        Thu, 05 Sep 2024 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725569248; x=1726174048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Hf3O01u3Ljb1Ba2rss1ItqwhVifdhOzdjDqnEMWUE4=;
        b=aSxwKa6bGtsIapZ9uLFMCy5X2M0y8Yv9xZpnTJrK2hY91+XSEYbkLRkNGiOYv/aMvC
         YcvVdtfAMmlQymmBRdYxVQqKgKhLguNtTwpSLqRo/iHcYCO6ti7KoCyZEqNYUySYaCso
         O92adS+NqTYT7OslWlbzR+K1EMRhC3tSsjfMT7Xq+4UhPgSWSe/MmOA1ZTj+l2TsRNEz
         O4N+iuGS9sk106nl0HW9wL2xhMhuwGEnD/yJdTrORN01MPvpz+9GZDtNclypMuebMBjt
         Y7qlEKM4FaF7rH3KMcwUefNZM/B7vNAJfwzYUnB2/ZAyGZ/X9wBXTbI4Lcciz4P6ITKn
         sYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569248; x=1726174048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Hf3O01u3Ljb1Ba2rss1ItqwhVifdhOzdjDqnEMWUE4=;
        b=s8xpCyHkjX1bq8/vMLAmoGtB0pQCFR3EVBLF1F4mHh3G22FFup67oT7phw0xwseJY7
         OGL4Sh486yuemYKvV5zS43dChakmx3e5KwcMQ1RAPK4pkK6dD8+x3XEkS8lK0H6UmRMw
         YlWdlWz5XVm/UQYeHycgUHagUt4wiwKFN/sIn5q1NWPJfKWXTtuhemNFG876/g1EOXtz
         v9JR5VOxeRjmjuua0jVNLoJiNyKlOB6mWfhiDBYeZ1qozLTvpOkkT5QQIEafowGCyXId
         cqo+X6FMbtc+cGe6cRwdVn1jvKm+NlignYMTDE2IiRBUDxQof37udYk/RANezjBcIPfu
         6ppg==
X-Forwarded-Encrypted: i=1; AJvYcCWYdtx4g7WXPpcGWKpDUnoLfnXJan7kCrFOyuAJ57yS0x7F43UQ1pBLjkrpIBsQQWM0fvIWQKUaYOO2iIRZMq0=@vger.kernel.org, AJvYcCX7GIc/lFioO6V5F0+jqlfeVBVOp4L+j3/71vcbCJpuHii3J435RGqJ8RfcxQCFtM/21FZzKjrs8iqJPs72@vger.kernel.org, AJvYcCXtaXypiDK/fqX/wPKLV3Y+givbu8XWQwSSiR75CasQFKfpmz1jRtxw5+v1lEDEYVmC4s/DuqGI9SRYorI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP6pWzh/4UZ8xa5RB/pds/ebeZgjcJAbYr5gtvXo3EfnfmT10c
	am4wqV3qDNo7BQKzL+YS/WE66nWBQh6j7Fq/zK0So5Jv+zAzXzAyYkyfEmreCNV2mCi2BPgPbeE
	g6s+uvFMKJwG8urtDSBdBFYMB5W4=
X-Google-Smtp-Source: AGHT+IHBnfpvUZLq+D5rM3HmOAZ3FYHbbKHggg2E/Uzv4UBeQqK6HMzVh4XmZO3Ym2cWB8SqmfZ246AVIfNPRB5HY3E=
X-Received: by 2002:a05:6a00:92a5:b0:704:173c:5111 with SMTP id
 d2e1a72fcca58-718d5f310demr244784b3a.3.1725569248195; Thu, 05 Sep 2024
 13:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <CAH5fLgh9Moq_9M+zMu300ohK=mPqkLyS6cpQ6An2Q3THCPFjaA@mail.gmail.com>
 <CANiq72kUBPnua1Pob++-6SJ8MeGxQMfrePY9SQVd0DZp5VU-2A@mail.gmail.com> <CAK7LNASHdd8Gv6OpXnP3tywrTA6iEZVqZGLb0V-vV_VUR-ksWQ@mail.gmail.com>
In-Reply-To: <CAK7LNASHdd8Gv6OpXnP3tywrTA6iEZVqZGLb0V-vV_VUR-ksWQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Sep 2024 22:47:15 +0200
Message-ID: <CANiq72mtaSGtDx5fn2VPYfyBNGVDm7adQAYxJh3tvd6esLiaRA@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: rust: add `RUSTC_VERSION` and
 reconfig/rebuild support
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 3:19=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> With the nit in 1/6 fixed (No need to resend if you fix it locally)
>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks a lot Masahiro (nit fixed and tag applied). I guess you meant
to reply to v2?

Cheers,
Miguel


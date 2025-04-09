Return-Path: <linux-kbuild+bounces-6561-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D206A832B4
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 22:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06BBB1B6534A
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 20:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72ECE219312;
	Wed,  9 Apr 2025 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIGnSedf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A12214A81;
	Wed,  9 Apr 2025 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231289; cv=none; b=GHYhovihk524ZZcGN/m/fQR4XxS4sIA9O2Ky1xqekY70n2TaznIqRfPAReFRdy7MqtQjQEwc8V85TIrcZmmwKvpTnPmQPvnUFVXgUoXnCR9ekL3i9lpiczasp7uWQFahF1IhXLkQGcfIoK2op8FaKNDXISsy6c/ok7/vQgDMFdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231289; c=relaxed/simple;
	bh=08M4Cu8f4/GZ76LZsMQ4KuG2gM4zTrxyaw5Ut0KXJPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCCveQIfNhQV0XGZij+YcS+moOa7E8gfQiTHZpDFXKuz1AS6XP+N+aQAIKumWWtXrZQPZ2OOQtf+J+1/p5Nl12uTw5jIq9crW41URV7yi6O/n74OefBAqYNW/ZeRjiEME7Ov4+aOl+qBaEf9P5gl2NQnWq3DtgnnG+z+4FNeg+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIGnSedf; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301a6347494so11041a91.3;
        Wed, 09 Apr 2025 13:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744231287; x=1744836087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08M4Cu8f4/GZ76LZsMQ4KuG2gM4zTrxyaw5Ut0KXJPg=;
        b=QIGnSedfWhoIMesXhDOKtuiTXd/2HHVPSpdjzgy7QDJcP/WrNnJKdethyWLDuRAh7d
         Uau3ifxdiADswgO8DPtpKwmVdvd7zxEPOJsAu/5JmYCJs6kzI90mc8fLkz/1/DFbH6eC
         Hn0YBn7ewc+aWwFiUggqJCSkSCB6konVZUeKLe+w0Uf68wkIeA5mNHLG/1Y0i+LcQ/x7
         KUMalexSoBrecFLjjDmqQvWjvu0qq6EJ22cTloGMXycutO6LYE2OGdUv/i95lAm4wMGP
         K0KxE/4jDknr2NcUY2pW9qEnGTKFynBMcWrHfOWLw3Oo5vSg8PuUgwvuBBoMwkKN6zYl
         YxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231287; x=1744836087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08M4Cu8f4/GZ76LZsMQ4KuG2gM4zTrxyaw5Ut0KXJPg=;
        b=ILF+jhmHemlWA6Yv4cCMSJlZGcwRaM+VgV3bWfhXqtDdEtIXN7PqHONk5p2N6l0gdG
         SkUD/0OP+5sH4ULyO+SDxJoBwV/0dKQvb5Pk0u2fVCm3rou8XdM1Z9e99GBTqGz2hQNc
         cc3cQM2+PB7DefHYQEVe3yQvaG1wrk3oJ8/Rjj0XMhRnbZCHJZKg81Nf9pfn4PbqAIzh
         88OCu6B9wOp8BwlRbueGzs5YSg+pADqjVESunugVsrGa9XF/7D14fsJcgD8tdFWAzCfD
         kBLFxZMi359C3fipY5WA2gtBqUPQ+qD1bpnV3z2LLTw9yE7gjBmqpt9fIrRQIdw6/JbQ
         aPDw==
X-Forwarded-Encrypted: i=1; AJvYcCU6NzXHjOI+hr1UYbUlLkuDIcUiXr/PXi9DKgluZnLSi+yxlUsr2jqMk3885XuaSzvvt7PKM05UZwpZ/s+v@vger.kernel.org, AJvYcCUPgronXCNTFhG1fomJ67Jg0snEZw54GhVXjnTP4YtXercNP28ZcxzQcSbyVKrzrcn74cEehbon59NBv9H71as=@vger.kernel.org, AJvYcCVHdzz3Tu0suDJySpZVLgQrT0UKSmXn/iD1oCewop5419G2WU2XLZ1WxoYigcpO6dffTE40tmmue7Y8sXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YykO9AWGj91pgSOvVRAMw4WcCC35zQfZB6o9X4cj1jIq9LMJNIf
	uhhjulg5liAIwugmBESoXWwadeNzo+pOHzMaH/Gl1OgjRdhvXvpgsf/YtKexwpuLX+NBg4THGf0
	2Xh+cWnjS0nSnsMvEzdTJXJgBR+c=
X-Gm-Gg: ASbGnctCCNpzloNRtq06tOJJ74M5n6e0poCunL9ydXd2/l+jkdJU6bMbtZSpE3vkONF
	3G7oYj3/o64Z+1PmarBsOucsqa8WPhmeM2aStBOeBwU7Ti4HhriUNBCzFWafLyDl0iw/xhIZ6Xm
	q8LO0fiyInZmNrmKW1id2S
X-Google-Smtp-Source: AGHT+IFlUdAp7iMiSSgLlCglw5++ynmRK8YOdTyTyQRlrOIa5H/c9zmUX9o1zmMc1bgLsmOJg8/hInWZSh1WIL81/3w=
X-Received: by 2002:a17:90b:4d05:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-306dbc0d00fmr2047978a91.4.1744231286958; Wed, 09 Apr 2025
 13:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
 <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com>
In-Reply-To: <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Apr 2025 22:41:14 +0200
X-Gm-Features: ATxdqUF2RSyMHln2rE54PHHogZqs6zCAKePrIc8_VSy9IDLlXknSuaNOZ6Lvaxg
Message-ID: <CANiq72nc-A2WZn4xgfKyqr3GbgenhXjZztHqnf=12xY16ggHkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Is this compatible with DEBUG_INFO_BTF? I'm concerned that we have the
> same issue as in commit 5daa0c35a1f0 ("rust: Disallow BTF generation
> with Rust + LTO").
>
> The commit message should either explain why we don't have the same
> issue, or this patch should prevent configurations from enabling both.

In addition, from what we discussed in the call, it would be nice to
have some performance numbers compared to not enabling it, as well as
compared to cross-language LTO.

It would also help to know which users out there need/want to have this.

Thanks!

Cheers,
Miguel


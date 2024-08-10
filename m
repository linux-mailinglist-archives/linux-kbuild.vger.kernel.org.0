Return-Path: <linux-kbuild+bounces-2931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D61CC94DC8A
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 13:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94E4C1F22032
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 11:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1BF157E78;
	Sat, 10 Aug 2024 11:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+HULIs7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE7B182D8;
	Sat, 10 Aug 2024 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723289866; cv=none; b=YJZ4sQg0dCpikZxhozdcj50NonI7bzTBefVOtkCPQrvCiqw20dlETBC2OumsxE61G8jvIMEfGEtZSEmqINVqARreLY/phfo3N7NjxT+Ze6GsVWV+EP7xqIGXQjNLgAWY0CLyOUsmdbVG35WbbU+/MljejiWio2pUPhet9jDZjn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723289866; c=relaxed/simple;
	bh=nyjMbTRKzIgup19D4QFqEmhTVziVhWMsAuiW5Ia3NJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUhRbDW5kP/d7MtD5WUSfNcBkoOyBv7zBAZDuwflBxame2eUk3cQ5JIADk86WpG/OnDJTKh94UQ3/+SssGQZGp1+2G6Vmtt5AzDhjz6Th7lC45aDt4JKzpVfYCEZKyCOt/ZKlqwgQAjTpspQ1+ztNXMwREE7JcXpqJwFZS50MSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+HULIs7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7a0e8b76813so2039299a12.3;
        Sat, 10 Aug 2024 04:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723289864; x=1723894664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyjMbTRKzIgup19D4QFqEmhTVziVhWMsAuiW5Ia3NJ8=;
        b=f+HULIs7zqspSGk/wLQkqm9gUXXp2mdKPUVOczirMOy19BMO7xfBPPxP86P7rK2yTQ
         ZSRtqYdU0HPoiV4a1XS95bIGgMxTYv3MsTGgYBvVRRU0mtwdqvTbi5w2IbC7tVqQgMbY
         dhZA0Aoo9Hq0xmR5SWMv0nc8VihkQZG8K/hqi+s24v9Emc+0aHX2ja9/6OEGlFQoupMW
         hDCW0VpAw7cs2KzoPEYWBh9QYz739an50shCboUgwXa+Yn23W2zco84BJUcarvB4GsHT
         54BhcEEzvg0yBf/1v8XDahGA3MsJHENhyyOmYPtW5lfbFiJol1klRLnJ8klzGWs2EgF/
         JxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723289864; x=1723894664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyjMbTRKzIgup19D4QFqEmhTVziVhWMsAuiW5Ia3NJ8=;
        b=Eror/sCaz9M6LIePkIic1t/wETCFJmoYF9E9vjXtnnHGbr+XFY4xGqu58vQ9st6af8
         B8VtO7AKnA5iuCbMlVOstwzvy1AARr6ag6yYmIoRYNrSucmKqYe8RRAWEs7SZronmzEa
         ZIsHOLajmE1aTv8PNVcF16iT4A9HzxPl1eDCskZM74vBZyyazIK+Bvvzk75ZZP13w8+u
         hcXWgqCq2mEEmzKeLj2YqEYSKAlNdCd+gXHhofvt4xB1N7xj3dwLPTQXXOJU/c0SZqQS
         9d9L6Bjf3T3SxefUVR1YUKd5b4g78Do9BEqy3hPZmy3P7f3r+EpKOz/j9OQgkqUEjF4N
         ZB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJVKAH0SaOn6H5Xm6ialzGId07ANVkl+ghnMuyTJr0GKBZOzONzpcB8T8Uu4rByHZUs1lCP2+f6oqQWgD2Y28T3Z+XDjvsupAQnY7wGZaDlXTpztPZfNoN3tHIACCxHQ4ohzimD+SD5IQxuz9ATB6Xg/i1HLb3PiCE55M/GcaachZKLMsU0ZfIG/U=
X-Gm-Message-State: AOJu0Yy6uZITP8+lK3yWVn988GsaqNDNioz5vvZ1Na8bynLWFw5+3cya
	YX7bd1qrKuIeFkHWFO/dv++SyUP0mErUyQ52NxGVLbpdXu9DRr4N3WxN+2ViKg77G2Z38D9EqeN
	avaZ3R6OJXWbGs0BBn2YykE8+X8o=
X-Google-Smtp-Source: AGHT+IGbxcou3CzpNZyydQ965UMSaM+Z4qXaE0eCioeDzM0foGhNOabnuSmRRl/OGET8O//67ZF0e5UgZi3e8GvIer4=
X-Received: by 2002:a17:90a:fe8d:b0:2c9:1012:b323 with SMTP id
 98e67ed59e1d1-2d1e804a767mr4955578a91.27.1723289864432; Sat, 10 Aug 2024
 04:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-3-ojeda@kernel.org>
 <CAK7LNATDZaGrqvugf7JBOvYvJTH=ZUacSvFZtiJW=9k24-wWHw@mail.gmail.com>
In-Reply-To: <CAK7LNATDZaGrqvugf7JBOvYvJTH=ZUacSvFZtiJW=9k24-wWHw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 10 Aug 2024 13:37:32 +0200
Message-ID: <CANiq72=o7cRR909Q_Umr_Ssg5ZKhTXna5J2Nh-_goTGm4ssF-w@mail.gmail.com>
Subject: Re: [PATCH 2/6] kbuild: rust: make command for `RUSTC_VERSION_TEXT`
 closer to the `CC` one
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 7:53=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Even if "rustc --version" starts to print multiple lines,
> it will not cause an immediate problem.
>
> $(shell ... ) (both Makefile and Kconfig) replaces a new line
> with a space.
>
> CONFIG_RUSTC_VERSION_TEXT is not broken in any way.
> It would be just longer than we would expect.

+1, I will update the commit message when I apply it (or if you prefer
a v2 if you are taking it, or if you want to drop this commit, please
let me know!).

Thanks for taking a look, Masahiro.

Cheers,
Miguel


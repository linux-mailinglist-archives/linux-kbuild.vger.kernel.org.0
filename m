Return-Path: <linux-kbuild+bounces-8115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5836B0FCF4
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 00:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B7F656348E
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 22:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8174C272E42;
	Wed, 23 Jul 2025 22:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DvBNqPRo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA51F94A
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Jul 2025 22:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310018; cv=none; b=DfdPyrK8x94eQual08V/payBfu7LVNS3Ofb3RALhl1Jv0eDV/jYGlfCwlWL5YMJRxnbWYTW6OUQEVK8kxLjDnZeXecmpBZxTFFBRGfvVD+dHoN6qbdbTMStj2aGBkvN0Ep/azdfrXg+8IEBDk3CGhNlJGaQ6NkQNiMmNr5ubQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310018; c=relaxed/simple;
	bh=yrn43/Dd88jzmaaVGTzLoak7dGeibPTUtixV/XrA3fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6YSukNY1CP3OWvCT4knKUXdvd9QDlqiHXUweLSYkfKZdEdW7JsQ5KpcQSMSJHghho5VQu4+lTBC8bS1pgj4Uqv6EA7oGqJjiia1TK9Udhbp8pQOzxtcmlyXf5nwQY/syaHEFHSykYMmC/l6DCOTHucUwMf2ayGQQUfDSnqWsbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DvBNqPRo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0d7b32322so54436166b.2
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Jul 2025 15:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753310014; x=1753914814; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U3GqWWXpnYm25spaRnX4CYYgsNtz3In17QSKaRJKdgA=;
        b=DvBNqPRoyvRS1zfc43FhWogxogWQxNy3BdHaX1c6uNpPevEIwi+Ve+k1U93LcegiN4
         EHfNYqlJeAWcAcXpuFZsstGr253E3wd7c7ggp2uouROinzt8hgp7ZB7q6uS2EiQ/Ee9i
         Wf2voaOA43SiRwmIr07twUFyEOTAnquluvGuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753310014; x=1753914814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3GqWWXpnYm25spaRnX4CYYgsNtz3In17QSKaRJKdgA=;
        b=H8HljmD3FpGypOhxQCTBiLInDTs+dAmlhYkA+yHbNW56y+A65zpzEaA49wV710o/KG
         UJ2pEBEeQowAxfuGk9cCDzFYJwsL7sYwPYMprf+ohYflcb1KqUsKa9O0LBbRNPoUUvkn
         VN2QD+x1hwl+bpSgCnWB6XgKINDHdDFB+pnbY5RrXoshgkrA1MnipDAc4a2yG/kRdeVJ
         GcM0hA877KwX4x8me4MMO6Qpf/cxIcuxMMz7usnkqkQqVeDzEsH/gj7rMFjSu8IWoRBu
         mr0DjIhzTm8xHCF0oXJo8WEm+66bIaV0yWaTsCOy5hRyN78XCdWoNrfdRgV5L81QRgvy
         owrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWiTHSXhZhDZ8+sFtUGcVg5Z7ykzPjD/KoB96LwlRkWwkpFz5nlnDaVY2q9LbDQXhHjQJFpkvUsV3ssZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKWT0MnJyn3ADetVG6QHdNyGX+7tNZLByuiQ5noYYb7O1p+Fw9
	v/tn/ohUNkH1Eel5Bamqbsz9PtHgM5hvT6HCon6rCe5/nhzaQestlyt+tJj0pVK+viEUTM0Fhyy
	u/34w3xU=
X-Gm-Gg: ASbGncuIX05HXIrvkFnZSomTtNxnqpWp+ppiQgVBAUAy+hnJgZb630XwmjcjZetZoYf
	czHUg4Dea8myYxb0u914lsOocWtLl+NV5CzVV+G+puE87JNkNWwrY1LvcEuKrboI9Rh8z+kKGMk
	IgOUj1D1kvbfa3Y5tR/s1akfVnYJ4ilvnm3bePPeUwGJcrgYjUo4pDdvFLqvPmanx8dJlNAkIPW
	l1Iv5D2ugyNqt46/4RWbP3FSrHGcW+A5s4PnmvP7vBCbz3GB99SiVbWLO6Z3lt4J+g6kH5QIQH/
	M6SIjA1KNAhAo4f46lkx0x0Isd3Txw8BYZUSXLTH/r6diM731pm/rz/82gLMZMi0eyTibUeVw1E
	vVQG6WEgx+XjH9A0jfrPtHxN67wNYqrAmWoH4uRr6BfDH1DyE7rI5uLY22oCcgPBwM0qEPRXK
X-Google-Smtp-Source: AGHT+IHjPozKXF3hQ/NPl8peG6PsoxIoQL+9oSfNfmrHMe/r9opSLTLesMwu5mfCIiiINnhsduQpxA==
X-Received: by 2002:a17:906:99c2:b0:aec:56e0:c4a9 with SMTP id a640c23a62f3a-af2f895981fmr503459466b.28.1753310014461;
        Wed, 23 Jul 2025 15:33:34 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cd650c6sm17708166b.59.2025.07.23.15.33.33
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 15:33:33 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-612a338aed8so675931a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Jul 2025 15:33:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDZNhBKYVsFx9SklyKj9aRhcUvUHtrou1G9tEKjDvPe2qwS60ViAjmWcxKoGnRzVGqHEmERcKsLcKcrwQ=@vger.kernel.org
X-Received: by 2002:a05:6402:3096:b0:612:c966:4464 with SMTP id
 4fb4d7f45d1cf-6149b596940mr3270676a12.25.1753310012644; Wed, 23 Jul 2025
 15:33:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723194141.617125835@kernel.org> <20250723194211.768813368@kernel.org>
 <CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com> <20250723182701.195a5ddf@gandalf.local.home>
In-Reply-To: <20250723182701.195a5ddf@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Jul 2025 15:33:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQA+kGVKaUqSGenXVZHaPFkuojb7MgJKVetsXZnLMFuQ@mail.gmail.com>
X-Gm-Features: Ac12FXyMftZ3rEphBYdwOs1gj8AFlxDMI37MidwdrkgzW5H2-qOMpERJA1z_XSQ
Message-ID: <CAHk-=wgQA+kGVKaUqSGenXVZHaPFkuojb7MgJKVetsXZnLMFuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] tracing: sorttable: Add a tracepoint verification
 check at build time
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Jul 2025 at 15:27, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> You mean to also get rid of the TRACEPOINT_VERIFY_USED config?

Both of them, I think.

> But this will require that I change how it's done, as it doesn't look like
> it's available when sorttable.c is used.
>
> Looks like it will require a separate application to search the vmlinux.o
> instead of the vmlinux (which sorttable does).
>
> I could probably take some of the sorttable.c elf parsing and move that
> into a header that would share the code.

Hmm. Why not just make sorttable then use vmlinux.o?

No need to do it twice. Can't you just work on the original object
file before re-linking?

                 Linus


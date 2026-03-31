Return-Path: <linux-kbuild+bounces-12425-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PVpJOADzGljNQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12425-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:26:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5436EB82
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F264431B2D86
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA62344052;
	Tue, 31 Mar 2026 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g4GSVzlP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AC3342C80
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977476; cv=pass; b=Lx19rL7Zk12d2DErhnAZj6D4g4UTjSZ10lfBwDFHdinNhztNW2KknHSGjtNZS87KoJh6Tg21YUnsO88KQ0CzTCdhuYblqBN1IVAOej1s/os2X7K4HbuJAKUeo8vbER+DZa6Au2dvjf32ZZufW/dRWKuYMS7vEL5IEqeRDGbO+PM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977476; c=relaxed/simple;
	bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPCcgrAitsij8lQrNG4HXEkRAnTSDq9z/fAWlbGfYkHMZR6R2xINOr5ssGUD6z4iBB3eRN3H2Y2eFVA0H/5EFfJkGoRqHpMF1CyFKUxfyPphonP8NDFk1WsGl/dMZ4tqeG24lk/ospIGmL2Ah/Phk3GzF7M+2pxzh4IlRIrjeFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g4GSVzlP; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-60328744754so3689436137.3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977474; cv=none;
        d=google.com; s=arc-20240605;
        b=S8iaY1AYHwFsSynw4uL81OxghT07Ygc56+Mph7UPFAn0yCmaUlwROtWP0Mtqk0FOeF
         zXZzyG8o+MfLWnHiXCjtrIJWmoGKqhkfhHDg3Fc2HfH1I8+UFWmxL7XPPT+Hwi5saicA
         0EJBEQ4b2kZLbJCFjVei38PsiG2ymoYWXMctRJzV0AtUftq54vTlOuSkt/P1wa0LwczJ
         Na8xe6FsD3tLWiGf7xIzYa8v7S/S8UuIdpXOFSMhiPB4PJDP8zifLnQnagRdV24XrGfE
         yLcwGkX5vm86hYbxOY4e0aiodE9ih8whC9TiHB+n9dQe3G6gjCn3FoH0hu5wd8zNDjJ+
         JtNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        fh=d1nbMGA7SJZCjyLi1NFn/CQmML1lFw3bH2pjNXR1gWU=;
        b=ccKYJgK+3WdesgYvrm99tEnE98cVUs9WtP5p2H9dQJ9cz2gSxH0API2QjnVxjh/guA
         JMlA1DtGUKIKPmQVKvo5+Y7Lkv1VIMcy7BSp78EgPOpFz1cyEPp/PVMigoA0K5mlDBuZ
         BzP3Z8n9st6p2K2CXmzVOI+qUga8Nnm090+IDNQTgYjP61rEkhd5xYv1L9U9XIZZIEp0
         2txNEe4VKLnvpDyFA4VBMG9a7B4TyaT7QtHHC0+bQcSnS44RFQ+LjzfvRkm450wyl67w
         29KCP9FSgfKWVR1pG0Wmv9du6CeIhi+EbLcXS0TN+YF3fu4NGSmEpo/TVUZa+uSEYSpA
         F8ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774977474; x=1775582274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        b=g4GSVzlPvZyTxCdQRik9r58eeT3v3a/iTwQpqVjcArg3oZq/1wkwpys2I1Cf/kxCFH
         6djOmhHrT7fomF/WgtcNZDLzyYQG7WnV6dNM9A7kHloTjNwFhbvPNBwNiPJCGMFgJvIv
         nrhzSa9HTdWbe2JaOROrd9RyBsYf5ETfj7+f1cYQgn9sjWCJ6+9OaafpGTm7j+7zglNw
         f/qze2XNhWiUM6J9/gfNoCCvR6g2PRwDDfs22f4RpveOsgfYG+5tEw0DLmTfMu8kRX1Y
         BnOZP+h6/0JJ7yqPuJjm6+pnI+7oVbmcSmdZUcSCKm5Loyc7/zq8j0IZ99OVMY+olF7G
         Jz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977474; x=1775582274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        b=FRinY+MLeAbRfQGTwW9UkHE12VAv7M8PrfXkOXztZM7kq47kamH/ikk+UuMFgmbaVW
         MgbGqzxtAR4cxkWS8tU9rl18pK/Wpft5Fdl6H3yxleERKmgMjXqZjKWPCN+0/uwtaeXl
         S7gJTyNT+kpA5KPYh9GbSU9fuIM3+1v7k8UySg7O6NoSuEjYVYLpUKTxlgRgnQdCnjs+
         FJ2fvgI5J/Tu/oOTcCDpojaXkqKiEvadY25b4pZ6bDMNiYUXUuj8QCdCXhqLuEXZOjFy
         fQvmBpEpwDfhAVz+lg69npz5Pea9jtExyNACCgr8A5ebA+5UOchVrEEAWjBcLIq1wguB
         Odrg==
X-Forwarded-Encrypted: i=1; AJvYcCXR37xdAGN5uo0wAZSirb4z69qIqlxW2HJYity770qgrFllPdrQselNYD8YNdBlMuLUQyj/h5KnrdbMpiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dr2+g53wGmkObTFjgQDdGWBZUgJTxbdJ7hAR4BXyj6aIOp/C
	p9JLsESI8jIidFXzneay5aUbHU2N8vQ85wieYz2ISNS5sBc+SR9pTLe/Zgrrz1IcgQ9WcCLmt9r
	3fpMmMJsgs1i53XwsVlStxxgBuhepUYNI117zhpDP
X-Gm-Gg: ATEYQzzcV/MLQEFKhCx2aLU2W7T9o2AiapgF6BF4FOp1VQyuvX7KfIqGvC44VxaZ5gz
	9HQF9Py5idp0qSWpG4vBDmklEm4HxzXADV46yVrhCBK24TCXQ630SLjuPfTZfZPOlL84Ey73PwH
	NsRoQI6tRKODb+Y9VATUu38NehVspZcVADvLaNJCOGf3DLXJk73pbX2NdSBS/67y+1n3lrU4TwB
	8nqnScD8xhEOCtmLOri2nMhJgAF0gf5lZ9tH652a+CaDSOC0vQiN7xbdOOEwKp+tEg+HVN5A97g
	cYX0s/E=
X-Received: by 2002:a05:6102:c94:b0:602:ace8:f20e with SMTP id
 ada2fe7eead31-60567e8d127mr40188137.14.1774977473726; Tue, 31 Mar 2026
 10:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com> <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
In-Reply-To: <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:17:41 -0700
X-Gm-Features: AQROBzDziq6Gf2V5ut4O-Crb8XfwsiZEe1mK1jC7L_WO2ZUVxZo1u0OLGaY1nqw
Message-ID: <CAFhGd8o2C5T4_-p3zsSbygwi=yDPOdpDBPC69X=R8qoefbVXew@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12425-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FC5436EB82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Mar 31, 2026 at 10:14=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 7:09=E2=80=AFPM Justin Stitt <justinstitt@google.=
com> wrote:
> >
> > __ob_trap and __ob_wrap are defined by the compiler.
> >
> > There are some examples within the documentation additions of this patc=
h.
> >
> > Kees, is it possible to make it more clear about what we expect of
> > kernel developers in terms of style? Should they use keyword
> > spellings? attribute spellings? only use custom types?
>
> Yeah, I noticed that right after sending the email, sorry.
>
> So I tried to use a macro even if happens to have the same name as the
> keyword, since that form is a bit more flexible, but it is fine either
> way.
>
> What I would suggest is adding to the comment that these were decided
> to be used as keywords, and thus we only need to define them as empty
> in the disabled case.

Agreed.

>
> Thanks!
>
> Cheers,
> Miguel

Justin


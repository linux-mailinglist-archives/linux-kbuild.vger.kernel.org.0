Return-Path: <linux-kbuild+bounces-7501-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 148BEAD9941
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Jun 2025 02:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEFA74A1C2A
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Jun 2025 00:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5533E1802B;
	Sat, 14 Jun 2025 00:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WezgbJk0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9379A921
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Jun 2025 00:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749862467; cv=none; b=lFCgxF7yq4TUM85I/VSjZ0t5TtoFcVhQ9sIC+zHwtJb/vmt/SGnp+7YGu6TDb8eLdGKfYbcBP5APITB4tSdCrOuaAro11zGQZdvRjwMio/8XHnyiGPB9zvfTMd1IJWCnh7CHEwAAFoZZzzeq+GjuLggCprnvdp51IWn1FbxuFZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749862467; c=relaxed/simple;
	bh=dbg3c1BYh2RqngzJb5eNWzqDUU5+7bNmKWGAXK29fkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejp33bup16FDIhAV6A+nt96ICTQnXjpDeolktiKsuPkAkhFeM565wKHdLP/n7RCkHq6IxMAOtoFsrAeyNy6AGVpb23mLmJUq4hm+DMKBTcvRHjWjl8+ETegRR9Zo1fJMQk+s4Nw7HF1rZxS5dFs9N+xXKbO/28dsqm+tlm4xOU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WezgbJk0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2348ac8e0b4so40935ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2025 17:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749862465; x=1750467265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbg3c1BYh2RqngzJb5eNWzqDUU5+7bNmKWGAXK29fkM=;
        b=WezgbJk0dtNUYgx24URetCr6EXq91Ga38mytsbVMSvQi3xAQnTtIvKvc1AjVq1GNEL
         UodO33phXhFGQouhEwYlWk2BhgrbOBJMRgN9mxMdKZ97o49a0IQIJpAv4MDo5Hk46PgH
         eAkkILbbUz1J1ezLysvMlv5ElzF6WaRVn4Ub9EiGorspTF/vytjkNvFG/RFPH4a/dRbR
         OTs+O4QmXqsqTPt05pM5jedM8u/uvv1p79t9RGpaxjhHEbyUgIcA7i9Dx+dt28KzMK4f
         MD9FQo+ZG+tOoahB+S1zTfA+8g/5vGIJ7v678WlCNtMvYytRYSO5WRzvrbX1mEyNiEsE
         P+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749862465; x=1750467265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbg3c1BYh2RqngzJb5eNWzqDUU5+7bNmKWGAXK29fkM=;
        b=OS0/5syYRiFAWoGK0evYOjtWF9eO+sMfL/CYXGQ7F2f1MKs/tvTT5sxn5JIsxglFkq
         pd5Bjyb8EXDgutX07C2jj2NethOrDbKgCNQUG1FWwPvaioycbsK84nDjMhFR092WI+W0
         vO7tBDqdePJ3fWguOwcGpc7a919oMpi1uREkxms2I8D8MCHFROFYF41m4BG8pVsx+52l
         C+PyeNPIdhmGzO/ZJR28+1iHpOJc2M1RYeB7wPmve2cvY6XKPaZVn4VeOavkEw7R4qnO
         A3nIeSgDupC6HsdkBPRdxUB8EvgV+8tzcUGuw+O8VdxQZfeMKAFmbl9JLGhcvgqJ/W+N
         6cDA==
X-Forwarded-Encrypted: i=1; AJvYcCWkXJJRTZm77EWxBfeI6sCir6VsTHR7yPBtUVEeY8DNcH/lkBWJx+9nM2zLu3lieDVqjVNIpHo8+p9KIg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzava39TAFujLerNZlNfRbM6fNiEfc+T2r8yZfZk6e6uyFMgZuE
	UbXzwjMS0kRlD77NKrdWdSm9VT7HG3tec8gQQlPrmsns3JGT/Mwu3a0dp4SAug2JqBXySmNF5B+
	swh5ZEx/eRoJvgUl7MC+QdMmOiXq0OdrggC/c+2tl
X-Gm-Gg: ASbGnctI5J4R3h7wtMjOYAfr15/G8w6vC80YPGhWOuhtRhu1CdANSx5+MRyBDbwMJrt
	/qxv9n52z6YaXrwL3UDOxGsNoT/CcdAjrxfFGyalKBjV+gHhUQSSsFrLf8n0KoeiHhZGTM6eTeC
	cCM7XH2cQx7n1aoeIan398gh3uM8CUnTuys4VZnRe8BCpBUB/7OAE=
X-Google-Smtp-Source: AGHT+IF5JrVHVbiN/102jVBcJgf8pP7Edb6rcI75OIdKcC6Rl/eoRwukBdcUmUcOznU3bQiIsNg7MVhxwBLn+Nvp0Wc=
X-Received: by 2002:a17:903:1107:b0:234:afcf:d9de with SMTP id
 d9443c01a7336-2366f01c6f8mr325645ad.29.1749862464820; Fri, 13 Jun 2025
 17:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609154926.1237033-2-samitolvanen@google.com> <dec42b04-b76f-4a2e-b060-9ac999fe1462@suse.com>
In-Reply-To: <dec42b04-b76f-4a2e-b060-9ac999fe1462@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 13 Jun 2025 17:53:47 -0700
X-Gm-Features: AX0GCFvhflmbUjvvF_yAMLbU4RfChKb2aHfDzBXIK7IMhzB8uMQ9kdWUKlDyi7o
Message-ID: <CABCJKuctMAeD0HjnH5D8ji-g1ZKoev-u6ni-UiDL3qtQhpfbZA@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: Fix structure type overrides
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Fri, Jun 13, 2025 at 12:52=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> Nit: This code was the only user of __cache_was_expanded() and
> __cache_mark_expanded(). It is now possible to merge
> __cache_was_expanded() into cache_was_expanded() and
> __cache_mark_expanded() into cache_mark_expanded().

Nice catch. I'll send v2 with these dropped.

> Looks ok to me otherwise, feel free to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

Thanks!

Sami


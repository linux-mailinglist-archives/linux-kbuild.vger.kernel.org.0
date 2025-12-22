Return-Path: <linux-kbuild+bounces-10316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB6CD4A13
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 04:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 015CF3006F5C
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 03:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D93E262808;
	Mon, 22 Dec 2025 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+PDF8KK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF862AD25
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Dec 2025 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374234; cv=none; b=Ae9MmRA5LJEL+1jivXkUGoG4OOxFP8e0qSegfY7o0KRI7unAZdvdipILKZ/zfu2uudI5i1HXX5x3MJB6J+sAkh1Rs7/SPZJwhU2HJl4d4PNvSGMG7quToSIBrUMcZTzDNJECTu/KHF3ZpifnLk7JaEkiGUNv3GctIDOigOetCaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374234; c=relaxed/simple;
	bh=0sEgOjWNYiRpYEbqOkuzrHuh+/Ex8OeQWPYb0COe5JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lboehxYJHebAOKHSlkF5xDkGgcsF2mR7IitCbGXjlR08uj8AK6ge6LYI58ayftvRYVgbHmxQOqwDoV70xU41Ai+jrdplaV8T/QfAvvyEItONrgJFhBCX95jjZAU2OkWHZBe/bt9HBfIi72YA8Y6Tgd6xeuDzHNklLJPK8l81mZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+PDF8KK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a31d7107faso2992025ad.0
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Dec 2025 19:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766374232; x=1766979032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COBSDkeJRHdKZMKtQx7qei9g/N9OMGNmu1xizfhqNYM=;
        b=F+PDF8KKgAkHduP3VPGNWhpLWxkZz0ykZwKbwPTiTwyvx4J/3y8iOKhBgTAdt4EV/l
         giQhTCyeiRz58THOpP5GuyHBvap9PHnflKAO6fsGiJU3QGLUpO/ARF50Wt8XFV+PM6ly
         u348dxLgpmICJJU5XA/n2Crag1PWp13FztQpMFQ3dDyq0lyYhslvLwwj7twre6Cm4XuH
         ZdkR8waivKPr8Ty/L5DHMLlPpcKN2vnLL5U1ih7IrLCchWWaV11uSqF/aioMHtxEuYtu
         LnEsqNanFd0VuXOkcvc7ZqA4UujX3Ku9mn+8BuL7nJOqbw48P31a+qB/kshb4BXoqYdR
         yOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766374232; x=1766979032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COBSDkeJRHdKZMKtQx7qei9g/N9OMGNmu1xizfhqNYM=;
        b=nkWnNs9XCvJcMf7mMczcWMH5KAQgom/cwDzwetUtvCOjLovQ28iGnOLeG16DKm2b96
         JkFooeiB0aOhVRI7C8tcusW6S58Qd/Ku4M7IJG7a/8WUu4EUDObNtPuSn50oGX71PuYH
         3LQvDzDR59qBy2fdNsqthjabOGdhpn1L9RB5R4jM+KHz6L6BYRKMLURSjoN7cXlOQuyH
         b/EVK/2UjjEDEDppFddecAc630poymLVsWCmKi6fsBilRzP3zB43fZE6dZFJUiHPBFl7
         8r/eHxSeKu6sC6YICF+Ho8MT9zRZOJ2N6GBj8aB4T3RXJQMdOrAL0/22PMasGT3VAkA2
         ZBZg==
X-Forwarded-Encrypted: i=1; AJvYcCXD6yCkcxZagBSpEj+fDyInM5/3IRP/Pk6VP3KpChvBRBF/YcGWnaza9tP+DH/W5vsIRCN5EaxO2NMjnII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6uivctqYLEzQwfg5oUGRY4hj0vs7lFCmdw4y7vN7V5ODmee8F
	1m74HNdUtLApSuClorKyPFZ5rjerJwlT3vY+LOXVCqUBff4T0nOyoqB/AwqyIxxhu7uBefWA4p1
	8JoKastw4q0Ja47r/XsA5fISyjf0eRz0=
X-Gm-Gg: AY/fxX7J1nfNlFSd1pkz216DLAjWWFmnDYuR1OOYfimfblVdsZW3cz91W87SvJxy9ZL
	wa022CxLp5pKQ3HZezAd64UqfyYJdE8+RH0gWERuLzwQaZLfjI2wlnjGD/vHHZMD5CbdBIe6b+a
	Oy0rs8imFblME1iwjoiHHml18c/lU+qhqdLigTfm2VPQwbD5uHrDfmwCt/p2CYdVTaxUCsgS1z6
	AL97so99SrZ2IdUKUnjVBbboSa6L0D8KXF4t3rZLg9R4oncCNPdIVvaXViwkx5dq2axn7IoXyh/
	gk5E3A7Egg8HLV8WyBP8wIw28jVK6sXupaiHiwFZu+bgnykYobLgSkemqvj1EzvUJHYOTqeffYF
	3ti2jIkQW3o6FV+EUqCShl9Y=
X-Google-Smtp-Source: AGHT+IEwHp7GiTxzNjQa+1kWbGxVcf+HWSVN1hKAodz8N06a/N/cWQQAGQMNADFaWCws3ABO/rPUi3ymBQAn595hUMI=
X-Received: by 2002:a05:7300:4f9b:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b05ec47be3mr4112576eec.6.1766374231860; Sun, 21 Dec 2025
 19:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766061692.git.gtucker@gtucker.io> <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
 <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
In-Reply-To: <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Dec 2025 04:30:19 +0100
X-Gm-Features: AQt7F2p6PVxe3-97y300_XoLgtbOQwn1v4BhwJSxqspmpx2ZlG3l-w_-sXw1ElM
Message-ID: <CANiq72mtqdR0EU9GM6yu1-Rn0V98ZftUA814eY3ue2YH1xdNHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 9:19=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> Another piece of feedback from your v1 review was to add a link to
> the documentation.  As it's not published yet I just mentioned the
> section name here in the v2 - but I can anticipate what the final URL
> will be i.e.:
>
>      https://www.kernel.org/doc/html/latest/dev-tools/container

A docs.kernel.org URL instead may look better?

Cheers,
Miguel


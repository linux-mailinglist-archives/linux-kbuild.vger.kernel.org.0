Return-Path: <linux-kbuild+bounces-11494-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOfbIibPo2mMNwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-11494-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 06:31:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D3A1CE91F
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 06:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C76B430143D4
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Mar 2026 05:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CC61DF980;
	Sun,  1 Mar 2026 05:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbHYhXbs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FFC1662E7
	for <linux-kbuild@vger.kernel.org>; Sun,  1 Mar 2026 05:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772343074; cv=pass; b=JP1ZL2LhkT66jfJVcvfE+dvoihGg3iue07tuGo+OiwKbxrnPq703nvk1XYM56tQUQjbNqB+EbIO7E3+rPJW/0fxKz2TCg1puyoA2AdqNf+ZHMoUVV56ccL6gySMnvEHvH+VTvNczEctCeI32HgpmrH31W/Ef0EQSvTi9zY7oyl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772343074; c=relaxed/simple;
	bh=NNwnCYl2rPukH4KtB5LvlChJgPp/kfrL2zPnQz4Pt6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxdXnP6K11HapvS977IhI0cP3+esfpDq+ROrdGonizHIkHduzg/aYBHWZ676uGdYro/76+pGrWu6qJ7SumEQL8wr+HIC4Bm7fsKypiONPq2Fzps36k0uGF3X1A+Ph2qidCjPVz2L9+cpk8Uttn0v97SJ7ji+ezUwZRLCvNWctgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbHYhXbs; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4399851b14bso2349472f8f.1
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Feb 2026 21:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772343072; cv=none;
        d=google.com; s=arc-20240605;
        b=fb0sRbE6wNaRtpglZ5LRCBX0orSb3ttCaaC8tobrEiX8/lEAUN/2WQBX5Mf7EqH8KT
         HeI3E5M3OOQw1OsXgyDXEuM6495YjI4cMv7AwT7i6/2YATvVyJFvLjAzjiWPBuqOn1Gz
         N6xhygUw8zPlA9kzLbtKHnHXKYepLv9GKXqHmYT0a+GD0mgQKU55+httMsA39zHMQulV
         Hxho5eRrYYSRmCHBDyVe4vtkmKA9p+eKTsYDwj2VWrXxXH4AOS5zpx2Y122HFvnRnlcP
         QnyrcY29chIrFDkdXAFjLH18oQ1b4sRC3jHYAcQucTEJZ0//gkaluTJTiODCAtum7QNR
         cCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=NNwnCYl2rPukH4KtB5LvlChJgPp/kfrL2zPnQz4Pt6k=;
        fh=jyw1ffVIyhlcV3moR5yQeYiANXkJ9xa9TxbdhAeUaIE=;
        b=VIfwKQ+jpMiX6fzCAXdL/OobeIX8dTgobqM4tJzRMQuJ7FT8yppQQicodnqgcT4pTr
         vSr6n250krb/SklaLztpavxE/RMuv1MCT835y/Ci2dt5qGa4WRzG8cn/kYeTXJ/Pkdbe
         fZ/Q3rygJ8PPmPG/5YeUzOpKT6EejteCzHHw9GACiQaifv881zA08483BHl0IC+nN0QP
         HdmLbIOaDJcTwzkJZJb20XcVsU60VuJP3MszFi+TTAnjJg2FMzP6k34xXGYhgNZSxRZp
         4X+4knd6B4qKzV+MLsM0kEB7VaI3/DSRQxVtzcltHFsKy6C8DYePIuN+4EU++XPNY/HU
         s9+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772343072; x=1772947872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NNwnCYl2rPukH4KtB5LvlChJgPp/kfrL2zPnQz4Pt6k=;
        b=FbHYhXbsBvQih7EQBw8Cll5J73GtSErpofbjlxWE8sx+iIW/1jqqtjyUQ566/A+mLX
         6nXmnSw6OiRk97FSQVpSrTKl+d6Stv/QPOuy8e9kIesP7Q/8KMG+gbfgNsP9sALxDj3x
         sEJJeIP7Bn2PjL6zAZlsrID0v7lX/9Te8LTC+sLBS3sl+HAuZWzOXb/wKZHfkUrfspHT
         5L2rnAwYFxzVIsG9Ybu9w9VNbkYaEWbdKn2dO838CL9Z9X+a3qKgoruZC7TBI+90Cgeh
         7SKSlQ1Ix+dV6fHARZMN9ZU1MVncbRjyg3pSoYPsYuxdHcD9dCsjUymf293LVikzdvyM
         6yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772343072; x=1772947872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNwnCYl2rPukH4KtB5LvlChJgPp/kfrL2zPnQz4Pt6k=;
        b=MBE03/sz086SpoAwkYf2KhjAM/SXNRjNP4UPeof47XEolespeewgMoQs5jgbzcBUWJ
         ZuRk9asND+CZkNWBpP1lAk+PhS2+utbl/Kf+yK36t4btYmUDOEIl50rODPRcKr8wgeqi
         yOKPwXLCw7pb4FYsL+JBTJ9xwPlyQ7IhYAWEbG5mtc7gmNOEtgrViJTpkln/AkMept1N
         ao/j+0cznSjLWGcFrD1DhW/A6gI8jf/PhEg48nCn4KKSmkRkdNXaq9oV04rxAh2lyOYH
         CEuaxLbtwopSxI7RQR2GuzmwuhNVITGB4O5CRY/po24ozFvnkRviawSAGLA5OVXHbESz
         SP4A==
X-Forwarded-Encrypted: i=1; AJvYcCVRgEOObtxDYLuiiSGwv7sC4W3NwcYGTMpslvKsL7nKINjFnZ2PaneZ6R8LdNJ7/lLVmUAz6y7I5T6OwMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmywkUxQq1CK26hdyNlDBoF3nQLggLSuzBq3gJ4SwtL5zLtvR
	f2OJeXA1npvznizY1iwWttJprMD/ZS2nzQgFmX6ozoA8kQ57x+pkQiivt3/gCPbNUEVm2MGiPzf
	Br4MoIDOoqwPCuG0J4OFnLiJ7PmQuIaQ9MgsHM7w=
X-Gm-Gg: ATEYQzwxOOb1ACbzD3G8DfyDelw0awqMhd5bjdg47LuWv3DcWw1Bnpo3RuR0S76dfRi
	p+je8g/mJbO9FwOvHmm0QTwAFC7DJPPw3v8IfqhTOz+0Iw0ov8SDYNbkKKYP08i//CEUT7J5XCh
	fEtroDmONbvAEVsvvQMtrhj229p7vV+s0mnOQP1VUT+3waXhaShm6PZTh59qUThBJtlBOdAXFMj
	3UI5a11kQdq+6ypgQJRw3xzFykRs17z8FL/yBjBmfDFtUty7N3hVDiWEbah7j9F5EgGb2DcFpp4
	B2LrcSuwSaoCpKTsCaoMK2j3cKGas/bKA6QOPCll
X-Received: by 2002:a05:6000:2881:b0:439:8913:bb6 with SMTP id
 ffacd0b85a97d-4399de368c6mr13690765f8f.40.1772343071319; Sat, 28 Feb 2026
 21:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225072246.3475275-1-micro6947@gmail.com> <20260225194404.GD2755225@ax162>
 <CAK+ZN9pkjJGD4h7jzQiMZGCr6kC4OFBVC4P9Y9zzm8orUjTp-Q@mail.gmail.com> <20260226203511.GB3196155@ax162>
In-Reply-To: <20260226203511.GB3196155@ax162>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Sun, 1 Mar 2026 13:31:00 +0800
X-Gm-Features: AaiRm52qaUd2-_KkBpYb1pNWhOtIMCAOeNt7dndPutg-2X_YhtLEkmNu0LZ6tq0
Message-ID: <CAK+ZN9qnqEbPe=-osemCz=3ZUXfnWuDc6j1FEYCZu0wQYryr+g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix potential NULL pointer dereference in conf_askvalue
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, rdunlap@infradead.org, masahiroy@kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11494-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[micro6947@gmail.com]
X-Rspamd-Queue-Id: 19D3A1CE91F
X-Rspamd-Action: no action

Nathan Chancellor <nathan@kernel.org> =E4=BA=8E2026=E5=B9=B42=E6=9C=8827=E6=
=97=A5=E5=91=A8=E4=BA=94 04:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Feb 26, 2026 at 09:25:28AM +0800, Xingjing Deng wrote:
> > Nathan Chancellor <nathan@kernel.org> =E4=BA=8E2026=E5=B9=B42=E6=9C=882=
6=E6=97=A5=E5=91=A8=E5=9B=9B 03:44=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Wed, Feb 25, 2026 at 07:22:46AM +0000, Xingjing Deng wrote:
> > > > In conf_askvalue(), the 'def' argument (retrieved via sym_get_strin=
g_value)
> > > > can be NULL. When the symbol is not changeable, the code calls
> > > > printf("%s\n", def), which leads to a segmentation fault on certain
> > > > systems/libc implementations when passing a NULL pointer to %s.
> > >
> > > How do you reproduce this segmentation fault? Surely someone would ha=
ve
> > > hit this if it were a real problem given the Fixes tag? Or is this a
> > > corner case?
> >
> > I tested printing NULL with printf locally and confirmed that it does
> > cause issues. In my opinion, this problem is more of a corner case=E2=
=80=94I
> > identified it through static program analysis and have not yet
> > reproduced it in practice.
>
> Thanks for confirming. I think it would be better to make this clearer
> in the commit message because it reads as though the problem is
> reproducible in practice. Also, 'def ?: ""' would do the same thing with
> fewer characters.
>
> Cheers,
> Nathan

OK, I have published v2 now.
Thanks for your reply.


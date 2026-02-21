Return-Path: <linux-kbuild+bounces-11349-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hPbRDSoWmmn7YQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11349-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Feb 2026 21:31:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957A16DD0C
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Feb 2026 21:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F5143020EFD
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Feb 2026 20:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B613644A3;
	Sat, 21 Feb 2026 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6AH5HFN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF47207A38
	for <linux-kbuild@vger.kernel.org>; Sat, 21 Feb 2026 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771705894; cv=pass; b=g9TsQ1vvgsGmHyrj9gclffKvW1CraR00JI5qYtA3T1qhHIslBS+4DZfc7dYFdyDWfV0Ljr0LA0yDgEe9QG6rAPNtvma4IkiLlVxJTinJ7kleg1/iJcG+HTDTUWZ/I0r8YrwGOjRQoBKGRSJVpvlptGreyupMidvE1ww/3MEvpEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771705894; c=relaxed/simple;
	bh=FrJ3od3X8M9bOPnstqA2Hb/cX/Yif+NbwT5ilPFnH3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxC1p3eS6RDQuJ8jROjO09Zq5cSB+cTA5aBN+6uoLdMgYNoDHDApAKTtxy9c5aONIt9wIZ/CtafBLB/L3kyXMAIeyB0bSBxFx7ornuJ1C1T5aXc+TPg9JK5rZIJMFettkgt88Pc0SU3VPRslH2AuJj3C+/QX36ctU7Yfa15vAwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6AH5HFN; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba76d64d14so64920eec.0
        for <linux-kbuild@vger.kernel.org>; Sat, 21 Feb 2026 12:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771705892; cv=none;
        d=google.com; s=arc-20240605;
        b=K2npEflec/Dk7cwAVYpt4FX+EBnFcSZdl+YCdkseiNtHpkZjUb2B2e9xKI4kwjbmjZ
         3svVbfZuVv687iofGTaJyvvv55E5Q4rXi7nKHvE9rGZHHEN6OPsUzEjeJyEnSQeZkSGF
         3CsLjadOBaasKjzNaMk42S1sZajK8bsc6BCxz/rqLN9+JWoYXQUYkIlyUzi0FspiALJs
         MZi6HKgcxtcymo2vMkbgsL5D4XkR60teN6gnsepqOkU6Mcu5h+ZaIEiU0sttJBrZ3tJY
         TfDIkZa2XuFIFivcBQhUzn75SMFUwdkbH69xJo3AmO1hpFpWti3lbRQMt/SyCPfqe2Xh
         6azQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FrJ3od3X8M9bOPnstqA2Hb/cX/Yif+NbwT5ilPFnH3A=;
        fh=MQMcbVLDU4s+I87VXS50Nf4xDYNGVodzJKN5mX8CChU=;
        b=XwxpbzKOsPE0c83dDgF6NBEGu83rhCoKhFQVUJp+3MhlMxzcDY86FunRoi+XisaT8h
         eNUIrxprNgwB2a7FB61wA93/SRw2kRZJ5zuZVTKHBPcxU9y1nh3mZRc5neT0O+4JE587
         cBYYlCpBQBF7p0SSY7n2SyceB8NXweavd1NkluWoA+dKKfvJHZAZbpwZGXnedcLjPB8m
         MRscWiyW+Gy5Pkc7lA+eE9aKC6yd76HmjZs6E+rs1Qz8wvh2FsguRh7JzXfFr0n93Maq
         V2aLTR92lUEEkG/U2rlGDnMSQbVucyw1+PfILKoYqNJrHRhe15MroEDSe8MHtdXIfOuK
         l/Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771705892; x=1772310692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrJ3od3X8M9bOPnstqA2Hb/cX/Yif+NbwT5ilPFnH3A=;
        b=k6AH5HFNGbr60z2XbCACCeQjrWalRYfvgDryc4Kjkox0RDdSPWdxvo3gO+OJSrdAxG
         Yqv81mTFOClKD6uRnUGNaz3pJMHL9Gt4DwNKJf16yQ4ayx6gRWq0GR6BtVY5MWRw+pUF
         1TrHp6zis+z5MaefMr6ckdNPjGTEMvSCCw+UnyyVg8Hg9swaU9cSjr8LNX559peXWV76
         aMImXoW7t3/O3JTVBP6wpgmu+0nYOoizzWaO88k0e8gIOy0JppGTsTCT/knhKmLroLOa
         93zQ6ehr1GIcpOtnAeraJSGhank+yAB+oSyPo0JdeAVL0k35R0akwI6bNLaPPtYLkHDX
         6DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771705892; x=1772310692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrJ3od3X8M9bOPnstqA2Hb/cX/Yif+NbwT5ilPFnH3A=;
        b=AA35ky5m0T7VqXu4Svxp6HUMSLvgAwagB68Kwa6JCt4SjdzK9E7MJ/J0miXbUdEd+j
         8biwkZLtUawXN6GRrSFlJSiffB5f1tkve3JkXEc9pUGi3DlIsKrVq93QeC3iZFm9Lj2U
         84NCSEruSqdl7ZiLEfjplGuaYTk84pKrqps+ApQMcJdDDAOOcIhpnKKkEQuXsBVTbDBt
         4FvUIB128BNpE3/qeqrkeeSPZ0foxYFe5ArVTdEWOoj6XJpzF7M8eGdu1g9ck3wcsvh0
         nms9pct/SzlcQI0Jk4E72AxAFuGDd0e8iJ6sWXg8hyLVkY2Gg269epxLkpw+gvUO+Q/n
         zljA==
X-Forwarded-Encrypted: i=1; AJvYcCWrl2ATZcbbTeX1H0PCDopdY/93PFfBdZoH0b3GPDdYAiaW/3jjA1ypsbAXlp983Sgt6b3CRpehQJ1w8VE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw47Qab/Cv32PG1uovVEuGiArizBUaszDcstLjg6QtxpKgR6Uiq
	6/hz1uH4sPJAzqPikcYvwU71oCupXBXXKb15TdwNPugDE7QRZcDNbeUNAd9MeZlZcvLsH3RuJg/
	6X+o6B8UevIBVwQW8fnBiVHqRudiXjdM=
X-Gm-Gg: AZuq6aIl5PIzlIhKJo9+NgUA9yep5a8gIBE8IlJfeZNzAgug0WrEo7OL3RIEZfPknvy
	4fc8Ms7J4zlPBs2dt27aO5ahmt1qTdhNqmGluRiiLUwhfL/yHSh8yvU3KQSnsI4LzLhOfulnWOX
	xfb9LxUbrtR/yolkLvdUwXvXwWpWuzfIHNiVIG88f2hpmD41lACX8Gvh5kDrNuj5iUkYatwYRgQ
	J1KELonPJMNgdUnDlHq3KUsQsmi5SZvmUVPwmC2T+KVWvZ+99CZO4YvpxDz+S+lFj5r3Crz4h3I
	5nELEyw4+TLb1zlv7jDnF6qdBSC00XuLntc/PvLk6eCUZoGx9BoSePs4TFAeb3liolH8Q+Rt49m
	mjk6a7F1wyaBvGfWKvgmhYLxx
X-Received: by 2002:a05:693c:310b:b0:2ba:7783:d1d1 with SMTP id
 5a478bee46e88-2bd7bb62b24mr903258eec.2.1771705892150; Sat, 21 Feb 2026
 12:31:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221081659.1742800-1-stijn@linux-ipv6.be> <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
In-Reply-To: <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Feb 2026 21:31:19 +0100
X-Gm-Features: AaiRm52aBfPYjtJMkeqYa1pVE2nBJzQoyEJKXJ-q7qII8d--4j4XXVFdcCdfMEk
Message-ID: <CANiq72kuP7P8NL51S2J48q=epqd+4F6iPXSPaVCF0ET7rAN9Og@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: disable GCC latent entropy plugin
To: stijn@linux-ipv6.be, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Emese Revfy <re.emese@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11349-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux-ipv6.be,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9957A16DD0C
X-Rspamd-Action: no action

On Sun, Jan 18, 2026 at 11:46=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Cc'ing plugins and Kbuild.
>
> Kees, Emese: from a quick look at the plugin, it doesn't seem to
> change the signature of the functions (and even for variables it just
> initializes), so it seems OK to ignore it for `bindgen` purposes, at
> least naively. So I think this sounds fine.
>
> Thanks!

If nobody shouts, then I will pick this up soon.

Thanks!

Cheers,
Miguel


Return-Path: <linux-kbuild+bounces-12889-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAIJA26o72mpDgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12889-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 20:18:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C087947864A
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 20:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2276302C37E
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 18:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B083D6CD4;
	Mon, 27 Apr 2026 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glFmjU6E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6CE3E1200
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313861; cv=pass; b=dDGlKWpqTr2WsqAHjovOOO7vaEUkK1PBijazkd1MzhGf0irZHxcs4KoPH4EUqig0ry8rVkRCcvqSOO4HtlZpf3qU3EEWbBoUxiS57J5ITuSffw6V+xaLJ2mO5Oy6UrxooIFZbvfCPPiiuEk7qBYWzjmaBldiuK+1Wur4uBeKs+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313861; c=relaxed/simple;
	bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDe/V4bszhxubI30hS2x9Rzo7JoTz0efZFGflrtLQxx7qHJAP72N14XrnFRpZWIOnYRQe0nLqMbx4o+HRyQTiHfbW9Vbmbarl5cBRf1K6hwwqPvUAAiS6WXNzUBRiENK5vwNh3HT+7FzvX5hdd2/e0dJ5Rm4VjIqhwPZnVAnNgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glFmjU6E; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1265927eec.1
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 11:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777313859; cv=none;
        d=google.com; s=arc-20240605;
        b=LV/iZuU9DPQEUuySllULC3xsnYyft+Esbtxoy/bFZ9rs0RoQNhsB3UwK0pQf1CPhvC
         xwtIq4bE+DIO7GfqrWxoEBhR0vc2fOfYpVw6PPgWKiiAmm+WGwyiH2Nq+Q1BBMEsaS4S
         pb0iPvyR8Nu0EvjdU3A8jVokQrx3Vj7eLYssxtCn5bBFvrJS/dy8NFqkg2L72HpzZPC2
         eeQx9y9vnaTLcBZn/A1NN81rsnUwkMynHxjIMEVr7wWOreu0tkzIC0SOv5oX+1B9o7is
         DNueB0+wPoQMD2bo/HSXqTzuUq0UFRmjFhJOi/AOW6kGs7X/zkrMEpfPqZpNKN4QNm/+
         71EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        fh=ZGI31gdgfc0EXWDX7WnitIa9VjzL8YaKSZgGW2GboNo=;
        b=K6z7Yb5N/hH/Oa6Rfiaw7u2NH6vvlZVaEClZYNk7QplaO2vsEDaTdBa9GmR8USC0nB
         wyIS5uCJDa7OJQweEFdlcKcHI0MnsInUHjhY00xV+uULTHsqXVYRAgnZuIMb5sjCWxCi
         8b1SJA8SJtWiGdn5WO55wuyOYEDor476UT9Cr98/btSyk5wONc38qmxsy5Dddo+EgQf1
         v2g8HkKwGDmom02Htx9dAhzwisYs0BExyVeL84dQjZbuZySJZkHL6jl4b1gilXYmNwz5
         KQDLSJMvLnF0/4k1S2FDLuYhU9JOEJV9KqU6LZkALCLkKiPInM5QiNqRGZcIqglsPZkK
         G6Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777313859; x=1777918659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        b=glFmjU6EpjjAmhiikI6XyaFsKJNvPO6HcmffI26zxMT2J75+KxOkQTNJUcFky7EHrz
         Was/gi/mwwiPC8xzzs1jaGtvKdg8OAbByjvFCCLV2mRxOVVYwdeZAEwZe533nxvLhr8d
         Y9B9kfL8JpPbwc8VQSPUDIFyN6t7ZgauNbtpDGIxoRZ/K1xQ7Wgur48eOUSGQGTOPZXb
         AobmO1h0ltu4Y1oLfTkv7DebUNcPLFRqVOd3p8XRIBu/FDpF5fcf4WJCimX6s5oHv/KB
         KHAbJ3Wm6ys2hFKoprpTZVjFKLNIAAqzqnPvOLLbDmdz4vziEuVeim8guKR/j4kTcjEs
         Q/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313859; x=1777918659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        b=UOSx/bSrPAbB5roXwbbNa6ab9KYcqEGvlY9rqcd2s1+vl1D/+PmaMiadLvD33UIrcD
         O1v8LDD0/jiQzDPhWtYhgQb8POAptkE8bFmFsEIealv4HHcmkwxk2qX3dKun6ZDfGs/7
         juXm6/NnmkfNgcMwBjQkrDftXpMv6fTWkoki8bi5OFIFBnKm8GaYbNktPvrS+U73eix4
         Lxdx6FAj4sj2+msmIbYNTC52hprhUPYtVn5A8fVBoYm8g3Ab+1pXrVRmkgsCoATDwFgB
         KqowGT0yGqbKwJBYCf2A7U9vVzpFD7Wd9B08qamqRKiXR325zv88b0YvOqTw1YgFJLdu
         ZxeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DsHsnmDX4fhejkNi8g8FAC3js0K+kZmMgUraLyV4c3N4JNQ5RwcVyo4WelFzLBc68381A2qX1L65PU1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWkoUv0BkhIuFxgj+rj7joE4C0n2iKW0o/Yy4Sn4xIJasviPk
	YESW9HAS1jltUZhfST2cYM7QkZMAJjmb4s1YT9dfeAcBWx5rponocLzz4DRiQlgEDDFJA83Z73n
	LQnM8oC6kWSaV7PXlaZCTdQbZLz7t4iE=
X-Gm-Gg: AeBDiet205n4perJs7NoMTU+JIksfTBeB2cqg1K9CogcOAfrYG/PpOH410fQEK4q0gy
	CvXsi+Eprqsc7g1/m2+VPvSwaYHvtYnKdlE4PMFx5uy+x9Wx7IJDko5KJWwc6QFGJP1IOUcNANr
	OPdpql6MivxNUbgbE3rZ6hgoUs3bvu8OR3DFXcn/9ad384fvySGJkgf9MC2nLXAEZ/7ld9EKe82
	uqb0u0gyest06QdoBbiWHsDosZpXs96TeFJjx0eXxDBXEYoohYpWuDPCqVCwOY/ixGaxAWs3pE1
	By1HBI5ehGWa4N8d5pQbA8KXoZclRHqOEG2CiORrJd2q2efWwlbbRZ5yTp9Pxy/Or1eQ1GLG55H
	itJRNqVMy1/YmwbrNF7t/3gcNP9I91EbkMQ==
X-Received: by 2002:a05:693c:2c17:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2ed09b8126cmr15513eec.3.1777313859385; Mon, 27 Apr 2026
 11:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com> <20260427174429.779474-3-julianbraha@gmail.com>
In-Reply-To: <20260427174429.779474-3-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Apr 2026 20:17:26 +0200
X-Gm-Features: AVHnY4KhSNd-WIZ0NrsCVBGrVQlV_jyP2VI5mbSl8TQVMeY9TM9-9Itbq43tbOU
Message-ID: <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: akpm@linux-foundation.org, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, nathan@kernel.org, 
	nsc@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C087947864A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12889-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 7:44=E2=80=AFPM Julian Braha <julianbraha@gmail.com=
> wrote:
>
> +kconfirm also requires the Cargo package manager and an internet
> +connection for compilation of its dependencies.

This will be quite surprising -- I think any `make` call should avoid
touching the network and should allow working while offline as long as
one has set up things beforehand.

i.e. I think tools and dependencies in general should be fetched
and/or installed beforehand, and then yes, `make` may use them,
without touching the network (e.g. passing `--offline` or `--frozen`).

Cheers,
Miguel


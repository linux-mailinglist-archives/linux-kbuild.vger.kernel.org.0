Return-Path: <linux-kbuild+bounces-13201-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNdaDD2RCWrIfwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13201-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:58:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E575605A1
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 141B330094FA
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 09:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4914635970F;
	Sun, 17 May 2026 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezcd+O69"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D1234F498
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011898; cv=pass; b=HX0zT8WnOjiL3R23vaHJyV9afBUDy3SKOpkgLsBCWtuP6/sPQ9JI9c9JbwFF+wEwuTjlPNfLZfQFOHla7Ury8iYRrModLDvI8A2FU16sYKu8frNKviwh38aRV37LGfxIKlLL1o1xqKF3E15U/rpNHyO9HHFnKURyb5bBiZ63rWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011898; c=relaxed/simple;
	bh=sp3vomFJbomNRXwJxSXApRuLFyKOlFqDaIARfWjsK6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIGD6g/+QT5jl39EFjhyHX0jx2KKYa3vhYEKCmmxV73g7XA8Ne+qzXelrKFeSIrsJflMTTzHqrjJvYFvEsCIzqf2Sq3cwm3GXx6yWnOOw06qUBvkL7GoabqKHW5ikxK9wMVLa3qIU+wzUm7elMMyXdxP6mxPms4rffSOnCO6hiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezcd+O69; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f53c6af46eso56794eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 02:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779011896; cv=none;
        d=google.com; s=arc-20240605;
        b=CKbw0dwtrtyLjJjmeZzL5y89CNbSWtUxbGZ5mkICP6tLru3UHyBN1+kvjRtg0FRwA1
         /BeqiGALdFdPHt73EfQEz0KsfDnww+JpSoPKpAgz7wXtzi4O3F4jReZy/s+6mHpEgyYt
         v7Xi6Irk29h1ahJCpfh2Rsu563Ve2M0Gs0ijmIXlGNkd7x2dBqjIiI1FVDA5viSAJw3y
         R8bt3TCgYYOOkbPIG/VCW8niyKmck6NmPjl80dy1AELBWuaF3Z0MY8YBCNa2SOk9RXM/
         zRN+eDEGOBmMbb5nl4o8PxCLUp1Qb5+xk9ekf7NxWnBsgH9Xm4oGi6gy+++ZHPpAxDam
         pkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        fh=LPBtIWfYohyJ36N3Bv1L0ZloqsP7hAFMcdKsiUx5vFI=;
        b=kx4H9Nmgo0J3jptWKZLVAcX1f63jTeXPT+0rJtydSUopQL3GHAJZRYnLzAkU/xF5QP
         SUqSwh+rx+Eg9BYVJ0rQTPK0xDbMqgxk4v1W0LWv6fQcTQcvSq16PMMT4FA4LqfJUveF
         IlLcS3p4E/d7THTfxcaqUCBv2br3LkWnZWkZ03aZFvw43jeHoNZvE+A4yrunqI2jty+R
         5cQZHHIkA/heDqz62AsYs/QVtVTuTamjM7gJb+EPoqZymmxF1kU8CBKwzOJaYJGN0ns2
         AXIeoYxc1YfUw0pWFmpesNTlPOyUdfbT/l19h5n3MJ6qtWrpshCL8cu/jx//fTtFKsIZ
         Yh+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779011896; x=1779616696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        b=ezcd+O69uadPZ5Wn6BCRWd4rAgDFUxZf32qb5GJWtHU18iWKQU4Uh21aCs8PGCrg2o
         gXE+MdJsnqk38JpqTQd1LEKAMVOZVNmwLdIFdXhBDFPA8FP8g+CSWLJ6oHhb1M+GtfzB
         Avp0eFXoU94fg+VzXsTkqCLpTYCmglZhhNPTO/AGYo0BCildVj4sFccyyLk6AK4zF9EJ
         8sB+RYGq21xgC0seNiRkF4p5/EqTqfdypgkYudazGubG/EsaOyOuLtKt/myuBbPc7SB+
         oDpNDwzOJZpSV5TvWdBd3kEfBl2+u1ytDxJFY/sgCwQtDuHqo+9dyC50EjUnppd371Uk
         YGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779011896; x=1779616696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        b=OOv7yxmRHKS63IA9k8dKD6PiyxE3dsbLEdVoj8/fweDvqtOym9pPWOpXYrF4MClliJ
         kNHVbpBcBexzwd03AXMFdw5NSP0mDraeV1Z1Ij7IEOuXBSshicU5QLd7qkMJ7igQrr3n
         JbobnKwy6RV3VMnYSIW+AkIyj4cwH8HmEwmlqp2hPZB3SgpcIPw1V+YIejYKdOAhPfuu
         qu9TGfg/D8QEoP0qb3lbxHnU5u1jc9faYrWyqHXUUweBCUO2XxalELUpZps57NZXmdCN
         SzCYpF+b1jIo++Vxl/Te+Y9h6t+f75axZj92phtoibU2JU3pdByMSvGttFsWml3HfGzi
         FCgg==
X-Forwarded-Encrypted: i=1; AFNElJ9iA3NUt2culIIKzRbc0+wcNZgr6oWimSqpfpA9Ow9cqG+6XsgBF8/sbSwzlXGWLb1mlcI5mTwZQ0x+PHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzviKAz6n6YgDzDECOZwarRkw4o927En9fe3Gj23Y8zf9Pq8e3B
	YGtaXj4MajLBidF1Yz2JucqwvLbDwdklirXdVubMbSaO2l0W66hEm8uFDiGxAw3YvvgnGO2WrSU
	vGnmtNkTApWGuUsOchIl2ZAfkH1tPi88=
X-Gm-Gg: Acq92OFC1KD8YmgSC4b0t3c1kwJjMPmCS59W/+znhOoAAjd4OJGNRyF5eTo37QzBUEM
	TcR+2c/CDsBxe1Lj0Urwi5sDl1ze7NqGENjlChZSFKU7vGlZcTdYwmZLYrlFHYOBfSbBj8eu+72
	5hzDwW6Ea24uyJmBd3ZCIPD6eMgDKw/JMmnX7KJS9NLSy3dxEFQsMTht8KjCHQQALXnBhQzyhhL
	h84oGiV+C2DTTQ1dwZOVxE4x4e4vZXlLCDLNOqykZgElGG5MbjfI2Y8f7w9bp+allFpZYGLd8T5
	1jBk0kTOQMbZmZepbGrmD+ufOG0TQomxkRDuifgJqzfnVOLK/+AW0tdaPJD4zPGbhJXCtZJ95dd
	H7Y4V0B6znRDWJp9uzyrz+znwk4oK0yQ94A==
X-Received: by 2002:a05:7301:6785:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-30398176f35mr2482107eec.2.1779011895953; Sun, 17 May 2026
 02:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
In-Reply-To: <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:58:03 +0200
X-Gm-Features: AVHnY4JGl9cz96kI-HTqmFFF02vhAFr-_P_prP7jRQ5fdei8qmaB-O5q3qa_jXI
Message-ID: <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A0E575605A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13201-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,inai.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 8:10=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> I think it is simpler to just inline all of this code into its
> single call-site.  The safety of the code is obvious in context,
> and you can avoid checking for impossible errors.  For instance,
> since all of the options have required arguments, it really is safe
> to dereference optarg without any null check.

If we are going to have unsafe code, then let's please build safe
abstractions wherever possible, just like we do elsewhere. We should
also write `// SAFETY` comments and enable the lints that catch that
etc., just like elsewhere too.

(This is not to say we should use `getopt` instead of something like
`clap` -- as soon as we start using `cargo vendor`, then it makes
sense to at least consider having a set of vetted, well-known crates
to write Rust tools in-tree, as I mentioned in v1.)

Cheers,
Miguel


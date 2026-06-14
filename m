Return-Path: <linux-kbuild+bounces-13750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fHzaETEjL2qR8AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13750-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2026 23:54:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BED6825CC
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2026 23:54:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VwVIGJL3;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13750-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13750-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD07C3007AFF
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2026 21:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609F330BB80;
	Sun, 14 Jun 2026 21:54:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EAC3033D6
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Jun 2026 21:54:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781474093; cv=pass; b=D0JQbYm+fACPJWtYfL6uzSpl9zwxXGE0qVHWUixBW4Er/wVotTxNZ1Vxw6+u5Rr4xu8IQIhM8rl++fZDWZaQW2Xi0DE6WLF4y7me0ZuvV9r6XBDg/mxBfcZhJ9TyFDco2MfkWc29rSeuJoIcoHZgnjwwpX+U2EQvvQT+frXji4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781474093; c=relaxed/simple;
	bh=Qf0yMsCZ9zfXwkpc4N/auG7ERVD56pI5iBAnYfGz674=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ud4DhwyURLfajupSWVnLAs15P1rbLXGdH4aay+bBnnYDS9yoR5GNOb2i6TLi+LQKUctbJ300XMN6WIIF5KQBu0oapCUP4u129FMsCoT+WGulzDvizwJhSDAWUMjrFYB6OlOjjwbAgaPI7LIdZcvroVuU+xXxrrdeP53ZlaPIXAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwVIGJL3; arc=pass smtp.client-ip=209.85.219.66
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8ce65629acaso33105846d6.3
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Jun 2026 14:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781474091; cv=none;
        d=google.com; s=arc-20240605;
        b=CYxTOt1k8VN0UZYCisxY8Tlf0i4JI0z8+ZxHJ834gq2+gy3RPme/FeNQWL4/Yvsehm
         IRhDd+J+iYUky0fmDaUtyifuuTJfJoTW+atgqKOIWqqloClKrtKmoA3vbisXlBOFE9Ne
         W9oeIhhtO80Uyltvc2bxCguuu9KBTWfcwoqD9DIhsUcIAwKA9cWqcFLGZscT47JY19fN
         JX9lraC8FOUh0HeJkPyt+jvKc4FdudOSGeRRnh8bh30xiIyzULAxE7qCKNypRA+pZOEs
         tBiAOJPRua21ptqX6Vgq04crWsN6GWAYqBfXlpaKTLGWg2p+OwS9WUu+G5P7sPdGp2CP
         rmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qf0yMsCZ9zfXwkpc4N/auG7ERVD56pI5iBAnYfGz674=;
        fh=5ZH1tlFGI0WtlEZkkNdY4bZE4QAQ79VZm8QkAenh9Nk=;
        b=FNseLKKzEy5nFmDFsmJw6UV0oVEay0fgdiBGtCgSnNqiKX1fU9AlS4/eXV9zErrlH+
         JI5o9iugbNmg2SJHW3mFgd79xAjcznL68HE9ngXokjsCLEtxZ3iItQ8t3ybYMtpWDo6Y
         jmtaDBBpNKkihJo4iOAh1J9+NrVPpbRS5gEmEvPhCYio4SJKvAW/s+RlymguijtiMKPo
         oH4Yy+LlwK6mPZ2F8s64nV0YB+XN9KITGYmWJTP+c3EzP31DJi9NIh3Slp/XTsI4/7bD
         9d+Vn2GE1Mp1E+7+g0XPYmBL+uKVn6XTBmEhi4HceTGIZpwPUlzugIWLF4olxJxetn5+
         uHqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781474091; x=1782078891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qf0yMsCZ9zfXwkpc4N/auG7ERVD56pI5iBAnYfGz674=;
        b=VwVIGJL3gfY+Tfk/xR+0QWVqbyQFqhejzInQMuy8/GCPpckqPFf4GghFfanE9Jrdt9
         76Oa2TUFfQcFQyoToYetxVdQV3sj9f9xp64dg9Sshk3OXleaIjSIxbQWvEUhlw8SL8pl
         8MWvYc0jn1jbkqNLZH4WTYE+E/GKH8+0y4wAAsKVcPTodcm0UoVw5mxKYwQhpPc5aTlh
         iGmHFo4SgOudmROyx3lb/v1Y6SEYwwQfk7MTmjr8ZrunwyUmUcOgElR1NIWfEQR6Rq0I
         a54u+R4tgQBCEkKtenHL/gqLQGy+uVSzKkU3IgcHTYPztY5ZTUHwojcIPVuixT05+B4e
         7m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781474091; x=1782078891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qf0yMsCZ9zfXwkpc4N/auG7ERVD56pI5iBAnYfGz674=;
        b=Nh3ZQLPp3TerBL3JQutDr8a1nj/Fw/gcRo/miaGLAfpXOz0ivhycOJhSyflSfr5r0f
         DhGoI8dgsoEPfKf49NR65RngsftkklL8dJA7g5qEJMpA0+QKabrLoCBg3ZW/rXw4/l+z
         qSvat+4a+QYeQu18qYsIclTxJfqAT3E8a7MeHq3L5clCrW2yhdn7gmu2zsQa4RIL6ZpH
         PZDs4Lecn3LUpWajFPi7LJc7AoBrQb24+NpRt8haWnL5DECXroz57i9Iobym7xvqWPku
         ffIQmqVKeEyu+IerP5jZL577CcOPz5h/ak7B60kJco5sFt1DX8qstxcvCxExqglYSAWX
         aYAA==
X-Forwarded-Encrypted: i=1; AFNElJ9prAGZ45rIn6g1fiHwJHNl449SX7ZuGrQcYqF0yGRRGlKdx+t0hb60KuUopmcKOZjpn9zmKwjTE3qpVNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YypNJG2/IJPvc5K1VFDJOQ3p3Ti75vxchOkWHYqh1s8jsui+2n2
	Y+ZHe7brRwJ+XFrwYFbyBxsWgQqwNX6dX+YWNh7O2/ZEto8ByAf7MRxPiMeHJDa+HPhDdA6/cmv
	pFKLCVPUvVxk8AkQlS39kEo6V4GXNfuQ=
X-Gm-Gg: Acq92OFk0JnkZnd0MnmVr6oO2ir0QZNLwqyji6VVLOq8PHNWF0aO7YEe/v3KM82GS4j
	ALdj3Ywk8wXZb1uuejdA49pGC4itqkndanaTrOmXsNXTD0akD/cDRlTtjAIWfFuhvxSGdA179u2
	pp/XrxVko5fUGEzUd1JtRLcuy7d1cZMGWjTzepn6Q7Ag6dcKb3d5n2wh6R6Ar0QNDcBWfyXIuUf
	98RORC885tw8xDIr14a6pwDVFa6H4XsqCVSkQErQRvS07yys/FkYNJocykM//aGWnqtWaoZD72a
	42FsvyD2LpEBU/UsWHoAotbRWmg4BwCiaDVLx+hdlCJxkX8fAt2cporfFL0KPGl9+xkh
X-Received: by 2002:ad4:5c67:0:b0:8ce:b2e9:a4b9 with SMTP id
 6a1803df08f44-8d32c010c50mr222142596d6.12.1781474090995; Sun, 14 Jun 2026
 14:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613232830.147116-1-enelsonmoore@gmail.com> <b677c9e4-edd7-42ab-ac0d-d721e7aaf2e3@gmail.com>
In-Reply-To: <b677c9e4-edd7-42ab-ac0d-d721e7aaf2e3@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 14 Jun 2026 14:54:40 -0700
X-Gm-Features: AVVi8CfSX4qmDdsQamkpbzjwvo5yJXKL2cP-eBfvDM14pSoM3YhHwOkZ2X1pY34
Message-ID: <CADkSEUiY5n0iTPmvUpbrVL7g5PpTUEi11R2Hqjdh-zU1B=7FhA@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: remove ISDN references in Makefile examples
To: Julian Braha <julianbraha@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Chen Pei <cp0613@linux.alibaba.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Andrew Jones <andrew.jones@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13750-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:skhan@linuxfoundation.org,m:cp0613@linux.alibaba.com,m:rdunlap@infradead.org,m:corbet@lwn.net,m:linux-kbuild@vger.kernel.org,m:linux-doc@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:andrew.jones@linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8BED6825CC

Hi, Julian,

On Sun, Jun 14, 2026 at 8:00=E2=80=AFAM Julian Braha <julianbraha@gmail.com=
> wrote:
> Hi Ethan, are you using the kconfig-sym-check[1] that was recently
> merged? This dead symbol check should not have the false positives on
> documentation.

No, I'm not - I had heard about the Kconfirm project, but not about
this similar tool. Thanks for letting me know,

> Though maybe your check also catches dead symbols in C, Rust, Makefiles?

Yes, it does; it has orthogonal functionality to kconfig-sym-check,
which only operates within Kconfig files.
My script checks for CONFIG_* symbols that are referenced in code or
documentation, but that are not defined in any Kconfig file. The
decision to include documentation is intentional and has revealed
several instances of outdated documentation.
It also filters out symbols that are defined in a Makefile or
hardcoded with #define, and also attempts to filter out structs and
enums (and typedefs thereof) named CONFIG_*, though I need to improve
this further.
I will post it publicly once I have done so.

Ethan


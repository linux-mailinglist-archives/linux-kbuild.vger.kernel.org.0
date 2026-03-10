Return-Path: <linux-kbuild+bounces-11801-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N3iKu94sGnLjgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11801-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 21:02:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D82574F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 21:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEBD4300C5A4
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F0D3E3C41;
	Tue, 10 Mar 2026 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4e/6xmN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E92F3D523F
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172893; cv=pass; b=plhI1A8Dd8G+mN/6wCA70Xdeh/PrUwNa+Q2nWE4oKuVUs/h6teo/u2mp9xm+YubsPnl3mq/RWfo100h7ZCK5tVXXF0ritt/fUeR/mtBOLLWh8S1QapiNuEG2+7XmkCYRjQ6qyaQNR941XzSy/XmgV6WvPUkD3s6SVcSbPiAgo9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172893; c=relaxed/simple;
	bh=eHz95h42IE6R5fUJyNeqX9dSZxQ/C8plsVpvlccr3Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UM9ypBd0+RdkrGGjQM2Xl1EinlNnxjfihlbWU8EBFGkJXadePlz9tFsI2nWTwmAs/A+x1LJQiIKO5Xctct2nWB/L+ifqpPqL87/4FtiA1wImiTcMXgAcUfYOAD9JV9grATLD2ekmJyVAzq3aKm1O1jyPl3rVieDlzFKl6raJd+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4e/6xmN; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a13591f163so162919e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 13:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773172890; cv=none;
        d=google.com; s=arc-20240605;
        b=G7VMqyhxGsRJzix6xBwS+mXkYEBudO0RP/swSg8gZjyogTJV94kWSFqLNNZiwww3Oq
         BXENxXjJ9RgXY+MEKXOeoarZIQxGPXKE4kiqRf+yWZnYyj7HNdqp4ihKrd5vAo/s3MPE
         ZCjLpEHDHXiX7ctcH5Tum65G41utWnvpmUwcT8T42pSjAwnlEhYdY+IABaGpnjDT9WiC
         OddSacXspjYVVpkTg/xhjhx9jVCaTxMWLqE8GGAFMa60rmoPmJEuaoC8TKCHeY7oIKPl
         kLfuY4fBN3rfvAbv6SeqXzMdrTzFqghMXfafIKGYwpstFxc0LBw/tJX1uLWCD7TFWkcP
         2LHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHz95h42IE6R5fUJyNeqX9dSZxQ/C8plsVpvlccr3Cw=;
        fh=la5WIH05Qvti+uGN15PSdR5sb2DFBK+1C6vqZnljmxo=;
        b=SvzVHQMZo2zM4uvV+RllfyH6nOHZ6/GJvgUPU3BoXq/8mBTRIdGwtdrCeRArReJUfA
         bSvsdggYKh61BrzP2UEtCDKkI5de45WN9L6jrDRhLrJUusQ/h3IohuX07+AyvOGOQ9zr
         0WteE8J+Kw5zoKf3bKSB3sxEa611PDrzPyfBI6AVMQM+ALbEXSQTWopWPbdfssi3ueYq
         MJg7tUxgXMhpF9Pp/YMb0gRe4N/XwwlscD5tOAoJHkeGXIYAkn1rlHko1YC2hz+OTQ3/
         DqYOAv8YS/7BuNwNpRnmiFdK+t49qqou/2fQOND5NjHTnRmM/B9JAR7QMvAvqH1PrPcC
         JBRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773172890; x=1773777690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHz95h42IE6R5fUJyNeqX9dSZxQ/C8plsVpvlccr3Cw=;
        b=g4e/6xmN/srUqgt9azj3g0/8nBfaqwKTg2XizvcDyBb29I50nVccYTFlBT911P6uPu
         IxVm9lcz2B7VRWkLqIVeZoEDPvQSl6YAFVe5X/+W4pTuAs8ow/6BbtSYjzlkCV8vREvG
         +AY+++KcvsaFyA2WECdEQegO+eKLOduai8GBdeS9LEcIjJbuBLR95HPcDkrDD51UZj5H
         UO1GrkM7Z3O+zxwFTnP1AIvzX0BGnigavk56a6kLOa80JTuYbl9wztIyQVsb+4msiOku
         NaigIfmi7/SosN/Ou9cv8XjIcrBMCX4GjcmSVnEnF7yURuMJ44VkytZqFj7CNXWeSKPq
         jVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172890; x=1773777690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHz95h42IE6R5fUJyNeqX9dSZxQ/C8plsVpvlccr3Cw=;
        b=Uee/KJOpgp2fDaui4wtC1IdcEReMklkDbM4gYM7Xss/AmayFDYC0499rmekTTz5v51
         cilNF1lheHIdJ8aHWbKYkK1y6aIn6piag+ZjHgFrrbtmNyvCC5YGQWh2njPlLpM8p2Wy
         rBw5eehYOqcIu+7EOQR9SpJKvn6zBdAfbS2OCmlBHw2B6Y8xresjYxAHCyPciphfNgFg
         j6bqxtj8laXcrj1QuZmpw6T9BZkUbyNT4NYeE65LgjN/Esx4QpTRDE07KeYvve36dxqb
         05GQaaagHNerPdU6tJThN//KM4jc2AwVTyYtIb9m3Mtj4KrgqjMxbDD9VLoCiHnKrvMS
         kuSA==
X-Forwarded-Encrypted: i=1; AJvYcCXSSEGQssmLGTrEoiyWWIaqOrVcCqCKtGBXFTQ8FX7VCY7LgTSQPSp/+yYW/XWwa9Nd26vecEx6mnINQuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2zuq0w203iBFkGcTqV3Xb9Ajxqza1NdFMzon1OBZW9Mjx3Wm
	C+G6NvzPbr2wd6HgVY1r1Lj+75pTz/gMLmtApUw3TUdoKNnQr03Mz3ANM8f2/fHzKjGSdV36zRT
	EFUh9wxJDna4lkEHFOF7NC5MaAVKDAIk=
X-Gm-Gg: ATEYQzxS2YYW+ytZA3IoCM2SOcStwM1xCu4/jb10T/fjxKY2kdRZT6bjlP0Itv7CavK
	i+KTKRoQcH3FHqCABosq+1nkOXg2DN2Gl5lZjpCClLJKx4DoL6safexSN9ixTUmLX/US/UiQYF1
	O4dFq2CCDPIL6PPUyTAm2xqiYgUukCso2tzYiOFscjd4xO/f7XGhQ4m/JKgwA4NyBCcKUE16eGM
	ywJBBCN8F/UTLGhfr8RJIU+LjVD7xO8ffHysgnd8OmrfR20lmtaDoN+vmVV2jmWC5tRiscN4s+o
	f2vLBcd/10VCt7d+jOmxBgKmZrLHVj+ADAM0k9MpEq2Ec933EURiuf/KEB+XLTRqFL24hIOUS3j
	H0zrqSN3hdCibOjYwrv7rsCw=
X-Received: by 2002:a05:6512:3348:b0:5a1:2c66:90b0 with SMTP id
 2adb3069b0e04-5a13ccdf439mr2810723e87.4.1773172890267; Tue, 10 Mar 2026
 13:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com> <abAzTFLYsUxK7VJ6@google.com>
 <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
 <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com>
 <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com> <CANiq72=MfwGU7wpeUdYWhhOd962X8-KU9NyWDFY=wEo2_iPdqA@mail.gmail.com>
In-Reply-To: <CANiq72=MfwGU7wpeUdYWhhOd962X8-KU9NyWDFY=wEo2_iPdqA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 21:01:15 +0100
X-Gm-Features: AaiRm52enOAiph-APdQdO2FqtZPhgzhIRj82JOwPvDRIRrYBtmCu6dqmt61J--w
Message-ID: <CANiq72m=2qC=DQ4HtiGT_kt0q28NxCVzHCERrjDGH9cw6j5+0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0F6D82574F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11801-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 8:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> and so that you are happy with it one
> way or the other.

By this I mean that either way I would wait for you to be OK with the
change (e.g. with an Acked-by if we put it after merging your branch).

Cheers,
Miguel


Return-Path: <linux-kbuild+bounces-12427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BWaBHUKzGn+NQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12427-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:55:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 638AE36F7AE
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51A6030B84B1
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651BB345CDD;
	Tue, 31 Mar 2026 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BdS+H08N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A99F33ADB1
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977865; cv=none; b=iVNEfB8ybmo29pdRk+U/K9tcBWCjhVEQARq+/+dsG7srp0GyoLuBSSzfOl+zIRMFoNSLm4D85Hxba7nBIiwvZ940o3xFdKjZgvfuTzj4VucbJLLsU8UFx5VSmv2qH37AWn3YECk+IYxp6DHpJ/5LnKSmsP5qn8NtdAOX0zZsn+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977865; c=relaxed/simple;
	bh=6ac9F4nte1Yiyo3mPmvL0jRUpnUVgMzCJ+yaIK6fLrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJhYsyf/9495MW6blF7pHFCpz23fIu3Ln5j+y54UXC7mR7kf2dnFsFwghzVSGdSSTAS0zsPn/Ei2DYoGZOIbVcpdNXuetry0gkQIBe8G33UM+tyaT2hoBoPNUqkVLTSJzgCcavB40o1pY1URBkQ9Fwfn3mDEYatbfsfgNns+sFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BdS+H08N; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66bf15430ecso4337746a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977861; x=1775582661; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4f6EWJpSf2F8Fa/9meaVrgxvLf6j4eAN5dwsMo8lPrs=;
        b=BdS+H08N+L5AmvFxnbCc84Ii7fAxutv9mipvwdNpITc5Uq1TMLIuYDItJT8nYJ/+lZ
         1Yvt+OKIGmtgFnm05VS9pwcy0mCqRXWPZklsdb3bFkGYPEYrU1YELPCBZ1lFm/eJENtz
         0rCPVYKChtHjAnCE1HEOKsbBx5ilqTtf4Mbvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977861; x=1775582661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4f6EWJpSf2F8Fa/9meaVrgxvLf6j4eAN5dwsMo8lPrs=;
        b=e6LTvIQ84IFfPtFH0zDMg20s8EmAU5Mp5GBQPtlDmffc/EITxs59Fci8oYl3aOe+ei
         SYBelRJSEzqEVbekwMm9HX0tLpmwoeuPoxhfv+TY9UhsRSnI/uaA1gkOXdeinNWRL/zW
         /WOtdcPvP9KoHgXnDK1OS34D1KFYqBIfUoegpj/V1AcGsWTkofwNJVxZc9edyZ3+tARK
         WllWd1tIWOqYHHK6BGAjMI3ZD13lDDNgnXAHuj8hEOPydEky2pyDGn+RCEWe3GNogMd8
         wJ0wYrPx8XIt2mTm1gA3Vr7O92ZiawB8V4QuSOQN/YAoKG2hpilkpLuYQVbTQokEnTbz
         t7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV6dwIEJ5t7LdNgV32fflm3QXY9orFsRnXFJZk2PjWt7w/w0V1hd7GO8lnsC87BunUkuzfuQIb9Gcj2+lY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0XglAvIb7D47BVn0LTM9XJ89asWq+KCHYbY8A1yKobNzNF2NC
	+pE9NXV51v71JQisNOSukDdfIEc4lsfNPEGjvqtFIhYOnGKTCDXy9COT2V0ebEnfIT25Oix0bx/
	I0tbwCuCfVg==
X-Gm-Gg: ATEYQzyt7szKtcPw/lipa8lZRFV8LJyN383J6HVWpQ4NunzF/1v0EHwutBVk+h+1ijZ
	0rgz9i4viSxtvlNICI7dE8c538XdrTyjzwcUqN9mltRlc2s2SRLdiRuX2RCj3qJlAOIfBUez8qm
	Z0PioEqq1GjfZhzdsF6wIgTtpN+bVb+j824QkY9QtfWj4lEuIyMIm8ojZqMhrGRpmLMe5lnR4b1
	EGbdxc4u8b9Xc6M4Rhl8BIyfI3FGgGwpWDeLTanBSdihLMd6Ki1cTrYxUUELMxjSCqaERl4IQQB
	YA32BcfIZStCtWEKfYVG3lGSaO+nw7tDDDdKM0tZur8VEvZsnMCkpxsi7arB4WNaBkxJKuo/Pud
	hL/XWjggK/kIIxbyzmDPoPFJ4itYf+DoincvXy0roLFBoJ4OqsImydl/t4c+6vfTUM8QSQUPD3r
	ZnDp0kIxoF9KNzMLaOxfXrVdbfsafXy4xhwk1CG81by//8+T3aYZne+mAJvWBNbG4kWv89ghVXO
	94qs1dVGek=
X-Received: by 2002:a17:907:6ea8:b0:b98:4156:8787 with SMTP id a640c23a62f3a-b9c13cd1da8mr36547166b.49.1774977861216;
        Tue, 31 Mar 2026 10:24:21 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66baa0dfaf6sm3577716a12.28.2026.03.31.10.24.21
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:24:21 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8f9568e074so838420466b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:24:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU58krGvRug6vYvqaiIOl0H9dwP/DWt7ezgNyCQxZh/eoMn+k9RZHeN1jVj40FBksae4nQT1k0rOBpMQl0=@vger.kernel.org
X-Received: by 2002:a05:6402:43cd:b0:66b:b46f:cbee with SMTP id
 4fb4d7f45d1cf-66dafead9ebmr239737a12.4.1774977532763; Tue, 31 Mar 2026
 10:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
In-Reply-To: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:18:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfF-T-qrvL567DYD3ymqUhEXm_455CS=Xqvngjucd+Pg@mail.gmail.com>
X-Gm-Features: AQROBzDZPm_0YIwJ05O5Tx8cRSfkjvtMjCTPVCmkYZWKjM8JxXDJ7ksIZ8sr0Tg
Message-ID: <CAHk-=whfF-T-qrvL567DYD3ymqUhEXm_455CS=Xqvngjucd+Pg@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12427-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,arndb.de,linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-foundation.org:dkim,linux-foundation.org:email]
X-Rspamd-Queue-Id: 638AE36F7AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 10:16, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The only safe trapping behavior is something that has a clear an
> unambiguous and simple to use way to *HANDLE* it. Not just "mark it
> trapping".

Side note: this is the same kind of complete and utter idiocy that
made Rust people have allocators that abort when running out of
memory, because it's "safer" than returning NULL.

THAT KIND OF THINKING IS NOT ACCEPTABLE IN THE KERNEL.

I don't know why people keep doing this. Stop it.

                   Linus


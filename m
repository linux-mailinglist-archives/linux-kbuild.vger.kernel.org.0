Return-Path: <linux-kbuild+bounces-12311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNcPLQs6xmm7HgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12311-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:04:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C33340BD3
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F7C03012D15
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 08:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02633D301B;
	Fri, 27 Mar 2026 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip7e6S7z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB31A3CD8C6
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598543; cv=pass; b=GCVn2h9/fijwsGHAVwYdjVO40Q4/iRRLLxApnArDSDXlBe8I5vR0iwMRtaECszRCFW4EG0JqIHpf34upYuOOv53UmLHxghVxN0GiVwROsxmMmXuOs9ZHIMTVBrgqI5iBPe6MOES13CjQG3kiVTnKoW1cbpa+RuR5DCZGdInJZqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598543; c=relaxed/simple;
	bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dv465YEwSkNTq6rTarMqiUk4TLzdp5w3AGeC6/ZsQSklQWSNr5j4DACk+Yh6RKYEOocl+gs84dUSW36tDdhzUMz1+D7s7YQ7u3Ljl9qnnwmD0BkZjlmxkMTjEaW+axHpYG2yKINjcvjhGnULYc4OgL+itBeEzqH8wlZq8M8XFT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip7e6S7z; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12a77005d69so179927c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 01:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774598537; cv=none;
        d=google.com; s=arc-20240605;
        b=ELbR9Ksq4O//6CZOi7TaaLi3AmCon0kWgWUSjVae0vdfe982a0gXPLVtP2clfihkXB
         qUqv1dKUu3xAz8+Rq2/EfOBBR5Q5Fl8GbyGZL8zTgW32mGPUwy0FnWSqLhK97Vx3Cdha
         9mJCp1LXbjSgKEA2VKe7z2ulJ+MhnP9dc52NQhFP2ZtmOzogJwqqUMq0B3fO2k3q5+JR
         DdLRCoWjjHIi8YEY46n08D3YHjMQumDyUAYY0v4/IwvlbD2f/8gWBCMPtLWwFs4Qqgl+
         S4n9Q0k/fm8FKvDFIldcJmv8hJlsW5kAcMf6ZGNsHMcynkwCsUNeqdbDaxAlcADVdL74
         BmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        fh=+Jbt4wPX0L8wsqgIcppu2bjLYBhExwXxOy8QYwtsuFo=;
        b=lin3RjOru1jgReTdVJBE2B+bO/CNT5VvJ2JYvhsxAaGjxzw+Ipr97wrwBkGk0/wX5B
         tRbvH63t6aQD4FEVf5Prg/pDVgBvDgQBc1/Gi+tMOunyGis9bh2eYNo6IA3muPnRDRrN
         mOffxqTlV7dOKP54CC369jY9ObxgahiBEukiFmTXcVoGdTDgO/YRrtpsuSzfj4COkYK/
         TXWbeKe9N9oenjICTv8MlT67XQbrC9dFL9Myzfcvk159dOg+xd9rkw/cszXPxHvvggmr
         3x1qj8DSOD0yYCZ97fusag1LZkLl4nY7JIlmFDGzBjxBq+Io+KCHZtR37yrECrXI2Tk/
         3iEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774598537; x=1775203337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        b=ip7e6S7zpCeJ7eeGSTa2rHzbKJDRAwZw27gAeAwCIvkQ0inrTfHGIn53JgaGi0hdtb
         JEYzuo4bPKJrVimZzcGq4ydDVDxGVMo/kwOJfWU0Fq4kNMPtikpZ9mCnTtWlp4WvtV/O
         DNNnF+5MXn2BOskGD6CpQZqzA+3hR/70uuz5UOnq0vkixKU1opgybYJ1Nf0Zlin8Ezb5
         hldMxEzpNKusZZJfwrPFiH2/Q1oy7o5h9dVrzDEt7Q0d7XHgswEMI3ayB1lyceWbdYOW
         tHR3YU788xHCVEIWJlCloNhIk9aKs0KuK9H54kQFIedRENXOQq6V2K9z1tcDdXvPWyq6
         EQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598537; x=1775203337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        b=HTosLDNh4lSYY6DKCuAge86EqLxJBrCl4vlO+N9fddqRbZqBrGVeWxCDv5rq47qIfD
         GaUWgIjOff2W1PJrChgy3p3og7l+ttAWNmAi4EiG3XMNv+KM5lPeSdIF2uf+3NQj3FUw
         64TorvXBuvDft0HGJKDY+vyAMjv+AXigUqwmBVxbIYPlokGbv70K1wgpdWpCB3WtRMji
         sL3TEg5W1jL/NYBGRwCl9meytKl6E2o855iLIudXyyy22sE4QVT/Fsa4Vew1Msvx0xZa
         HcdkHA+rx6ga8OHaKBrDocn0Ow0hf+NywNhEvTUF64N93sI46Xfdhb5zNt5QDgVcL1Mh
         2Yaw==
X-Forwarded-Encrypted: i=1; AJvYcCXF5THsMtD5ERN36XGe1TGvSn9siyKRiVZftRWuM0hCvFnFzA7tekjDXhh9TkDS0baqoD5YM10J1tLpokQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz35IG1qWV9LeZ7FtBiF48QyPRDKhzouz5vDBOaWXDSVUAwXc4L
	Lp4OQ79uLQojSERMy0VjxwTHZfK5Pjk4wQg7zS+IuqRbxrohkQQpIvvIHPkWhuOnijzJf1RhITT
	BNcA4U0bFnajMqA56SGY60cWvQN1qH8k=
X-Gm-Gg: ATEYQzxVgawBghJSut3hY4C/bnRUTjwA3r4UrFIflP/PrrKSc/qGyWMzmEcRTDT3jqC
	7sSGXREfZnHZ8gdZsa9eOBL7jZN39vmtTGCx95cwlngfqxkTntqWFadUm2UcTkchsEJxMp+6EWF
	v+ESzxNnSHvNvPDmOq0xAaYEq/h9GPIrANobZ3fKzN/l14yn900nuDhkgoWDbdb2wmVbzQvcqI6
	nfe/853Qo/vdl/HFrdCWnpY4wxOZnUDUddg1aItywNRXRpJpzC2Xl6eUTC2m7CfEreZ+W5+wO0Y
	IPSr2SeJaNaiW7+Ufl/BV6fH9PqCqwgBwE2U0Avkc6QT2EjV93saG9axaaFMw7R4U5woJv/Ug4Y
	KKw5Ja1N3XuYCtFPIM2g1qyc=
X-Received: by 2002:a05:7022:618a:b0:12a:6cde:fd0c with SMTP id
 a92af1059eb24-12ab2906c98mr371178c88.7.1774598537022; Fri, 27 Mar 2026
 01:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260322194616.89847-1-ojeda@kernel.org>
 <7ad8bdf9-5eff-4443-ad15-c05355d793d1@app.fastmail.com>
In-Reply-To: <7ad8bdf9-5eff-4443-ad15-c05355d793d1@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 09:02:04 +0100
X-Gm-Features: AQROBzCrGdIlIe2CkDWKMkYFmP8XiqVc047zlhYRt_gjOqAGZtEWFJuOGnDO47I
Message-ID: <CANiq72nz6zB0jGahw4Eh-i-Rew1kQ0g_qcZ68Whw==MyjhYaJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	driver-core@lists.linux.dev, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Alice Ryhl <aliceryhl@google.com>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, 
	Johannes Berg <johannes@sipsolutions.net>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, Russell King <linux@armlinux.org.uk>, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12311-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,arm.com,gmail.com,collabora.com,lst.de,lists.linux.dev,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,linux.dev,infradead.org,nod.at,umich.edu,linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,arndb.de:email]
X-Rspamd-Queue-Id: 80C33340BD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 10:13=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> I have an older patch to drop CONFIG_NO_DMA entirely, which
> may be better here, since we know that nobody cares about the
> empty stubs.

In case it helps / for future reference: the patch I sent to Marek is
already in mainline: commit 2cdaff22ed26 ("dma-mapping: add missing
`inline` for `dma_free_attrs`").

Cheers,
Miguel


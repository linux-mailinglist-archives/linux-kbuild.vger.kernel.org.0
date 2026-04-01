Return-Path: <linux-kbuild+bounces-12516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFdhH0kgzWnOaAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12516-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:40:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3464E37B60A
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0347430457D9
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08D143C05B;
	Wed,  1 Apr 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iheeSOM/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC362C21D8
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050312; cv=pass; b=rYrzDapSkkmMYHazL2up0IyPotu3izD8MF5moj6oGVzrLNRIGliizmwCRofVWzNN8zcXxqfBjKMta2lWNEbcH6XFeXA1WbNm4crZJI1tZwEFKxYti1pQY2aTsAwMy5BJJQxjjk/dSvaPVlvAXwttyqma3zpfsjMS9eAkLxr62xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050312; c=relaxed/simple;
	bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJyLW62d1N539xjN6P9Sv1F9W65ceWEY6ub+kTUmbWfcvJeebwa7/6iINDDR4Tm44MjMKKCjoNn9VzoyLjJzCoSWWRhk7GLixtpvoLTb2qE94FAeuBUS5E9SfsrTvSg4Yj5/8FkJlTOFnF+SZXfK2uwhPzJe51QnagFRtBstfNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iheeSOM/; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd5658b901so286290eec.3
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Apr 2026 06:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050310; cv=none;
        d=google.com; s=arc-20240605;
        b=H71qivSmerjyJQbKncJSPwYQC5jR900f2z7TlAayT4gq5qDNkoImIB/xFEBg/SkO5X
         neZInYOsIIkyVlCbqtm/rvSTxde1ELLa40/xxR9MqGI2X1FY+JIgkP0PZHhF564j1poK
         KNCwXbjsQSonH/msjLITgflX+PGziQpQvi6Z3+7MFuo9Y01FYfcXBF7z56ikaZCRgHdi
         /ACLVMM7maQKbyckuTDazMlQW7U/mVsOz4A6X9sWPhxcCzJQyucvVxBg1QYfbuN0BqN1
         mdNzUJU/X++XfTX69B0MtBGSNcbn9jr6i7XVLV0ceKcHZACMbBuVkxbh7ADye0gkrFbP
         kNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        fh=JIo6yTICnfhSMO0BJVB/X6zGStJL8sifr/h/cjiIBP0=;
        b=B9CTWdXG9xzfmmoZDrVE8A5p+RGBdcTGk4Ew8pSkTTbsCyy1jRRVDSwAyqd9DYMHVX
         InzhVBkO387iXN9TwjwItFwl8q062OEY3f+TvbQca4ImlxbcaMcVA6OSMTvef4+Xa9qm
         UYV/t6mQsSlwHs5M0lALgoLqQShhVZsqe/thQlZjmucaucuEx+Lm9komE57Sxq5YOTaJ
         C7muqQllJuI52r+2RzrBy3iozPQ2u2rQdr50Q/r/YZ5UWfqo1rWFIvhEwQ6SOnATRVYD
         JEXKmWUdQrbFYshy6tx4dCU9A+8YbNXLw11P6uTBv7g4cE+iR2gH7nQIMyTT+882nCw1
         Hz+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050310; x=1775655110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=iheeSOM/qlwTqLbVsiJefeHkwYJF69vrE0fo5V1kfgUbcsb7yyWjVh+FtzsiFxYiB2
         Yn3EwIwdZP+mACB9dZIA7vmKuA1Tcg9dv/f3cjoFxkJYVO9azMYPXgpyaMmaM4e4tBvO
         RDxhhh7h6nJ0A/BWEimRwqTrxCGYPHq4vNd97ByVCZWz8s+jXyAPuLqczLW+IQLFINvG
         ztceSgS4vwjmS7nMFkpjeeEWlaF6zj6d0u1J9WU4s2F8p9gGYdA55JoJpDLa39r4g15R
         k7k2jhHIWMp1fXuk2bWDz1caK4xkHT/kWjRb2JGQmGLRXECgWUmFL+30Iry6wfepfAIq
         tI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050310; x=1775655110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=XhTnxVIiol4XY6eH00f92vekChMrETDrsXuRiVR/MW6rMjVYwLtI4ZFwq+b21xl0Jl
         oldtlh05pzGeW5G08nl6083Hama/Kb1TrrFXk/G7t9UoQxKkqNzYBAFm5JtLK5TTQuhe
         bV4uu3XxpX9Y2z1KhvMTNyDOZK5iko7UFmyfaLVo/Qp7+Mpc2MH+k6ciMN/wY0IbjsSt
         23Og+DqJJ6NgEltFvNm09EuF3s2mCFTaLEvm7UQ+52JVRXXl9xNzDt+A8FRj6bAqssBM
         96j43YUUiIsM6G6+6xshK1iscn6xGupDoGuqX08rfhq/+B6UPfkiMMhiCB1sTad9uZBN
         6ddg==
X-Forwarded-Encrypted: i=1; AJvYcCW3dTz33QeabgGHJHdaJyN2tbCM27HlJtJGYJyLRTEgRO9L96qSMOdhivHns3oYt8afvdxnZpPbe7AKKMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/mRH6wfjglQfN1hg8itUVUofTOC4DPhl1SN5mz+flzKUoK4O
	Yv1JxWISraM9lxbwKXbm+DhjBg3PV0sYOJQySKkjw2qMqsuHRTVsxhcqAg8jqpRw4DzXtKh16H6
	Noq6wYY+bqZwU/79CmjkQu5daDEZaOS4=
X-Gm-Gg: ATEYQzzxRTmHRuGN029YcW2gU+oYkyehLMdKnRaK5RIsbbRUeagQHtKHdT/uI42PlhP
	4aoShepSn9oj66sy9wNU+IKmkr9G7i5wyZp6raIJGskgYPRpKa2hLF4SU67AwsaKDf3mlud8hFK
	rbrRmDjDcC56ENN3g8D3Pr/j+5TBF+7ly4QLDJNKTcS/1ZxfFx5ZCvgQyrDTnsk+U28smQtQ6mM
	luYMFmn0KpTZI9suOI8BF+NjCHpVCs7uZtzZz4zPs2blI9FYiwzIrq1zUqodX7jtVuTpegiH0dq
	hNYOu+WB+4WMkkWRRrmpMfCN7JEretTgII6xWnU3fDcq2zWGalSr0nP3gQZLd7XuPH14l05Hmtw
	yJe9wF600LL6LILCOrl3inLlUjI8NpDGmAQ==
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr849425eec.7.1775050310241; Wed, 01 Apr 2026
 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
In-Reply-To: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 15:31:36 +0200
X-Gm-Features: AQROBzD4KmXruNHpjUyy0X5nLhLhXQUuTTY9eP3fb4LBTyRyQ4wVkUjvlUGGI0w
Message-ID: <CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12516-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3464E37B60A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 3:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This diff fails to apply on linux-next, due to conflict with ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists").

Yeah, sorry, I should have added `--base-commit` -- it is `rust-next`,
i.e. 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

There will be other conflicts too, e.g. in the list of features in
`scripts/Makefile.build`.

Cheers,
Miguel


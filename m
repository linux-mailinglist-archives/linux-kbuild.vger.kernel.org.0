Return-Path: <linux-kbuild+bounces-12642-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOCECDO50mlEaAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12642-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:34:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B939F76C
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EAE2300E398
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 19:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB9A303C93;
	Sun,  5 Apr 2026 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTQnoJHW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4482FA0C4
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Apr 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417526; cv=pass; b=KJuqDw1eSFN5SRyYUpPSHlofEUxIMmPgudfySIo75yTckdzhxlg6lP3NBqRgJYy3i6HK09+NQtHXp9ELfv6v/hY1AALUa3wbqRVhui+ajlJKqp+WTW5mSFpU2Na2jL3yDDIYCedq3LrNx+MeLPBshnG/HWfzbRI/Cb80/INJ2Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417526; c=relaxed/simple;
	bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWawZMaMguTpfl4sGQIscVypR1d2E4d32I7w1qxjzGENvFLUsvog1CtsJLr8FhEQ+Z4GjYlyiH4tyRUqlA+ILbyRNZhw4EtyOd+vGEppO0Jfd7erDXNxQvlPBn2WY5WeDThn2lhGuYAkf5189Y/EAHtswngwZHuIJ1t1lcIiJcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTQnoJHW; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124a7216c9cso129285c88.0
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2026 12:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417522; cv=none;
        d=google.com; s=arc-20240605;
        b=ViPHYmmKk4nk2Ggw+rIwaUuqQ/xMaN22ynJ22iReZ5+0TkvkY85PqgAqUfteJ4/NmP
         OfxFa9MCdKrA3JIxbpyuXIbPF+hDUOJo1PUAvrR1w+DmFSLS1JOttqD05NohBdcKrEGW
         Y4FPUIDNNqgzL3kteD/cXWboDgZMenXw/z0DH+tzerVh3fNQ+I8f+n+z8APPdKpL8RQt
         ZRUT8w6gbEj7MzDN0rsRFOVepyOT2M5QsyAfPb9aTENfD1hKDZvElJSsbxA54zOlgu8N
         rKgZzyrnCEWd/XxnIFSKsuV6gLnDA7CnzrtGgGGaNlHeFPf63htTNijQQzDTNA9GqrQ2
         XBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        fh=/uWkzv0b+x8JzOHQsn+iB6750zK0NQ66BbpHJH+uF78=;
        b=Hi8TVv6wpZK/k26f10DOY9AVLLyRVCkkA2grriMlhWCmtd+WK9hRMq4s20piYiZgdJ
         LW2gCSaS3AllOWhLR2oaF+73HppUwTuVRcVXlPho8AN05jrrA1Pubn4aOx4JYnMVGvjF
         Bsmc+WeBD0ePNER/RuFmUhApNgXgMIMs55WnuYqK37EVFm8VA3caMnDBnZ5JgmzJE5Bs
         tGNl7KIG40ZNLPkkgw5jyx7fyDGkfWBdbffn0l8GB2Q9WFyvxBWqCbEubOOePY21HBwr
         VJNLUSZKuooBxwe+hLWKeDNfw6nNignjIEet3X4NjfdZ6NILwSI+UnBanEAvKDlcHNtD
         1BZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417522; x=1776022322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=sTQnoJHW55XIOLQxTa/0ehf0g7O/5fqfreTXKUXc2JHcCniV1llpf87rmHdA4lOpTC
         MwB2O2JOTBUGOcMHQdnTwRc+9zDCTBVqj6jol9Gj88fkUJzP7xdqlqvAczMbkihun9pk
         tOyyu5TtBT6dGhanj3/xCmW4QDFclZUZHVQpnHDkn851pqs9Svq58p4q40XfzrXhsMp2
         dGofuYw2zhZuLPavKH4QgFYvPnQ3LgvcdtlzMuFvWkOfnu+AHqQVFjusoSm/+1uMnJ2h
         DZMwoGLm2iYuPXj5zMAZwDu7uZcKqLlyCVgtI22iva9fGR0cKL14VDNzzyKNZUscIkM+
         PmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417522; x=1776022322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=nWRJo3uL2UVc6CsLb2/wUrE60LXKDXE/FaH5cIs1MYLaQS16sUqdIy6Cvz/J7O8BjM
         EN241mtJ8JHogi1R8ncP4/e6dD/bFeidnr2O+EU2UguVAgRiUnkR71oWAo6+2g4fobUx
         mCAhlQpo//qy+gCCbKnJPM1ZflM7uSfjQp/wP72pe+wgmEKUzCQQMHsfVtLcIv0tcT3y
         sonpD03I357uk30juPp/7IzE+MPGZy2LN8gEBHhqOa40PbO91RB620Z/XElTggrLjt1M
         /h7IPLGnNN5T/YeX0+Qi2HBtwLHb7DUuVK8sCVjTAnD7aGTlXShz8QGaLkvqqssh7MZt
         8+qA==
X-Forwarded-Encrypted: i=1; AJvYcCUVwZi12PoxKDGsGK8l50VxUEu2XoPZu0IZskndVUmderKcG2z0NWTqdSWSFRUqZGNHZ6IPInrcP980Wro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjoMu2Ri+xCNUf3+jZwnhlE4jV6tyc6+5wekiJ6QXO65gWl9zu
	mOc3IDH79ZZErdhxBAexUEQjklhilgiBGkG11uPGxzPOq+YHDf7Z3Y0wsxULrkM1Vk9g+dNwM/N
	PqR0tM/t/qrX2yzRKxc1W4vOOaVo+XFA=
X-Gm-Gg: AeBDievlg9O4lqdoKk6SfUHyXu3JEaR5mNOO5enet/73p7b384NHYQmyNvkNWlBpl6c
	gHrbAG9TQDrCMI6mM3KhSADxT6RkvmtCHA0JYMcc4wF/6vQybVTHPOAFHdAOs/X59NGVonj/jqm
	UsXZuqaJh84RhRMo1kcOFQAjFqeFFvhPq1H/dVD8S/W2CzGqiCIFnFQ+TmrQMH/gzp8NMbwFZM2
	WE47LCUIrH77eQDy+NDpsOr6Ly40z1u51FkXFe9evPPZoK/NGKWUs2qnWvmSZHciAvGWlU0/7f6
	y7tauh+QJBldL8EEQ/uAglQLlPLZEkRVzfyK8HTpf6tFDWYO7x4vhaPPBWJW9Iay+0CcsOYbf4E
	fFvOt4qq5fqaFLV38c6fFVvesBRX1bpi0iQ==
X-Received: by 2002:a05:7022:418f:b0:12a:7181:2f12 with SMTP id
 a92af1059eb24-12bfb745195mr2138075c88.3.1775417521967; Sun, 05 Apr 2026
 12:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-18-ojeda@kernel.org>
 <177508434455.73816.15756486388132647025.b4-review@b4>
In-Reply-To: <177508434455.73816.15756486388132647025.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:48 +0200
X-Gm-Features: AQROBzC24JtVqMf2jJjrf2a1W5TmgldNN6NvGBvsNhQ1qBgBmbTFc7OPu1-U-ac
Message-ID: <CANiq72kh47Nss9+OdHf=wRhO2=79dxPaL_vcPv8U8qG64bYfmw@mail.gmail.com>
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12642-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 717B939F76C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Some citations pointing to the upstream changes would be good.

I added a couple links as usual, plus a reference to commit
7a5f93ea5862 ("rust: kbuild: set `bindgen`'s Rust target version")
that has most of the details.

[ The comment already mentioned the version, and the commit that added
that message has the details, but I agree it is a good idea to add
some references. ]

Cheers,
Miguel


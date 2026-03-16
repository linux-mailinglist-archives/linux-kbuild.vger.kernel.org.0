Return-Path: <linux-kbuild+bounces-11969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM7lB3o9uGmpagEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11969-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:27:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA3929E2DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CAA403010711
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EC93CE4BD;
	Mon, 16 Mar 2026 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dV61lPVI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143A335067
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682036; cv=pass; b=fr9tEOFHHwtuujFTvh24tpA1VSoUSKow/GWQVg1+PamsbFdYKWv/5jae5qUiybPqSsM/flB9phWYoLtnLlvGw7ltkyCYVBzHAwUuyzgiWS8JYq6uKQWLfYlUuSlKURzRNYrf3mRwnfNdkw+HBIwt4Dl/KIwL72c6lrwABrXcMqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682036; c=relaxed/simple;
	bh=hLmWZrjgoou8ms4KpWMSp6GeKo7AfRzoVomlCjML0m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRuQLnNDQVf6w3SqFuXfjwI2eWi/ZxG2O/xyWHv5dUqY1SptgXUB0XZ7X0E+qX7WWCAPwBiG9qTBZp1pvpxaib/IqG28Vj0+0LTa/yUOnmKyrd66Y6nDgwEWLFN51PPE1tXbQt8KDyQBBDO0vkTMEC2o9gb482d9MvAf4Zc2v+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dV61lPVI; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5091ed02c54so38481cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 10:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773682034; cv=none;
        d=google.com; s=arc-20240605;
        b=kqamPN21nGk+FjKq/M93XxLDcrNDEhraLYc/MU+RysIVeckP7yU0rjai1UkCDmupHJ
         At5WSNGTYXDrDF8MsJuWhleFjjRBaLBS8d64yVsu48cTVG01rip57XEDainqzZkAHCvB
         H4QNKLXbkGY03j7XsALWvz2RjL5AwN4ZHna6LBoawFgs+h+phIu9URp3G4OPZqocCiAd
         hUHOgqR269CHmjbDfSqw7Ab0yN9DwfxGkfHvTif10BMBdgOsJe/eopo3YEyVscyolSod
         1PBFE7ntqaqEUUVBDgu6a7qJ78EXLLJ/aJdmyRLkGMwgBXCJScnbWik8NVDOoILVthhR
         A5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLmWZrjgoou8ms4KpWMSp6GeKo7AfRzoVomlCjML0m8=;
        fh=sKrX2B+kYh3lUqDuiTc0m7wmCWipeUc4aYmZ1x4BTjE=;
        b=KKbjn0A4g+wyyZFYHxXB/V5B8fNKEjpV5uEgre4dehKf+VEK0LArHGm5bSynYQivz1
         No+NbrEQyX4kV6ASIlnkRntiWTyzjwHUTWGd6k5yVd95HPiZpZwf/5n/hBADm5JgN51L
         CVgcW9fon2EHiV1D1jP0IBZsWYW7M+zarHwANQtvrKbegfT4ZBEH+XWs7KAXv89a/k5w
         RzIU3AZ6rHmZgWzIHNEKYDYF/je+4OPyQ5Oph84xXuGtTyF+L1JihJBkYkoYzMophDhK
         0XGO+ewHc1LBI32lv7sux43elMQsP315kl/qE4Qh6xG5CF+qJXN7dHy++71cFqAjCey9
         8r5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682034; x=1774286834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLmWZrjgoou8ms4KpWMSp6GeKo7AfRzoVomlCjML0m8=;
        b=dV61lPVIeOjFHY0Et6ZylggYCnDcvbveQaUhKZV9B2Ap7FFEcvs1SesxbIK4k3dqS+
         cc/MUlj0CRloj3Y9zPHxrewMlDseaznibPNeWU9Un7cPLIN2amPffMTsdw2u9yXYSrlM
         aTX3XTqv+D2rQD6B/sdlt0X/I583wmWG7feZdkp452wWcp6Z+hAMucSMegPTtrbbeicZ
         IxYzF5OYK8/d0TMeP+ghKMB5R1w7vZwEQyD0cuzB2NVXBnbOPeBrqM36Q02Y/roKSdoX
         /QpJL5RbBpfefbHsC19XP5v2HYXZoCfLk1kgXl7pXxSX5mgJ53vFjlgzp2t02CXP/1tD
         Xx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682034; x=1774286834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLmWZrjgoou8ms4KpWMSp6GeKo7AfRzoVomlCjML0m8=;
        b=D8DEM2hwF3LtEkJ8eCLlhfzfTT87uh2BtTy7r4QLUacM8ePzeoalW1MB5U+Zm6n7UL
         /4QHp0e1gCWf+nrar0h1C4SjgCdXdrfWEEBNT52ih6jAYcYKgXvNmhRFulrt+uXeYUqC
         KhhGOvx5vWQQ7XfWhAvK9d696xz7WCAnJoolmHkLLXqkIc6DDSl3GSYcNP/M5FuuNaB3
         Le8Li4Qwws5FF994DcaIxHbeLPR08nSRlMrQFSJZsp4uPN14ddHOGNCDOt3t8W18ivRi
         eYRODJTRC/64BRfb9Q+NS+tQRhYfX4DH2IEXJWE4efjD1e/KqyVdkmuxauSj2cJuMZVa
         hJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVglS4lbkCSwRtE6CR7l9FNkbHXWPoecPOhooZItbU+2rvvYqHU9vNVu+P7bcRLN8ZOr+ddcTx2Iq8N7zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWf9JAKlwgi6m+7HGXe38CPW/6qAFMHpYuDRKADTcG4WSLWCJ4
	reT6y215gecfgcW8jZsfl2sh4P2b4aGc5Teux0oe3KZpNa9TYlohBXpX56CkWvql+yBhsRTSEio
	Y22EFHG0X52iDMZTFfRv4iSR0jpO7WYL5aN+WVEau
X-Gm-Gg: ATEYQzxnhbM7izeXXxTMUG0kwrech/zXKY3RxdwVL9R1D3wOSbP/ILogohPrh4cAlsv
	i/xqCkMUkd2lEhOdPfC8dmiiaXGRxz4PNVfS0FqiN7jRBAG7R9rBEFoNuRa9YWFahf4LUMNxr73
	gpAojh3vAcrVOWFzuDjs+GecXkJb/MxK4BrWkgCfVwyceOMfgFLwuskw+JbMqWUeTVv0v2UrZFJ
	DRJ0iSw+3aqAjQrXi2CdgG6WuRPJhJCooQZkF2iJLkSjqVFzthoekxiRM7q0ycgP0gLYxVA8dul
	UbOTJ3Ksqs9tbE7xhp2fWsgLJl7luuhOFDU=
X-Received: by 2002:a05:622a:1101:b0:509:371:f2ab with SMTP id
 d75a77b69052e-50998d570b3mr466031cf.16.1773682032756; Mon, 16 Mar 2026
 10:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger> <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
In-Reply-To: <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 16 Mar 2026 17:27:01 +0000
X-Gm-Features: AaiRm508nRBQqyKi0J_S3aneXqflQ2aLZ7Rt_tMpMtL8dLzIVmmTeN_BSRBpyuI
Message-ID: <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11969-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1AA3929E2DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I think the problem was $(AR) mPi and llvm-ar <=3D 14 do work correctly
in preserving the orders for "thin" archives without --thin.

We can either
(1) Bump the LLVM version to 15 and remove the --thin flag, or
(2) Implement a condition, as the --thin flag is only required for
llvm-ar. I assume the reported error was using gcc? (can someone send
a link for the failure?)

I think (2) is less involved. I can prepare a updated patch.

-Rong

On Mon, Mar 16, 2026 at 1:59=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Mar 16, 2026 at 2:40=E2=80=AFPM Nicolas Schier <nsc@kernel.org> w=
rote:
> >
> > The simpliest solution would be to declare binutils 2.38 as build
> > dependency; but I am afraid that it is still "too new", right now.
>
> From the last bump at commit 118c40b7b503 ("kbuild: require gcc-8 and
> binutils-2.30"), it seems binutils' minimum is supposed to go at
> roughly the same pace as GCC's. Cc'ing Arnd.
>
> Debian Old Stable has 2.40, so we would leave out Old Old Stable which
> would have a recent enough GCC otherwise, so I guess that means we
> cannot?
>
> (I was taking a look at this minimum yesterday, because I was thinking
> of removing the comment for a workaround related to binutils <=3D 2.36
> in `Documentation/rust/quick-start.rst` when I bump the Rust minimum.
> Of course, that comment is less critical, and those debugging a
> Rust-enabled kernel likely have newer binutils anyway).
>
> Cheers,
> Miguel


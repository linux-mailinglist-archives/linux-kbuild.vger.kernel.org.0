Return-Path: <linux-kbuild+bounces-11869-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBy2HY7rsWmSHAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11869-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 23:24:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D326ADED
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 23:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 117B6301488B
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 22:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F187B3909B3;
	Wed, 11 Mar 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGfaYwB5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE38A35DA66
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773267847; cv=none; b=j/YnyKKWiwQfc7C/TAL0mIjAm17j1byBSe44L2NtBH9MioF7nH68aZlABv3RXfQqE0rEW123kK5x0zu4U2Z5mf0N4JjGivwWjw5k0Un/UAfZBHjprndk63qqSvicC6bpzjQIiWTh69DByCYVYNNlXiTSae8F++QbngqG6wECy00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773267847; c=relaxed/simple;
	bh=ZLFVU5eapEktBKzOoBgi0i5NSJUcQ2q4Vyl8Jvb9E1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+W65mYIhB0nnTF5OpdtQygmJKCC6AAuqxl9XGjA7BX30CmUKgwj0dlR6bSEq/XnFhdD1uzUfAUvU5XLl8ETcPP/IYoa76GDnmc+ERUD97c7NhGrmeoZJZuZgef8Eg0EA2jLz6LS0jz+Dbx4MggBCpKBpXUWiUTTG4X+sNn5fPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGfaYwB5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D048C4AF0B
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773267847;
	bh=ZLFVU5eapEktBKzOoBgi0i5NSJUcQ2q4Vyl8Jvb9E1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QGfaYwB53cQvAke/lXZIySX+qGdO8r/IMsNYe+qC5rhNiywcUTxbgUZrsqlu4Ixzd
	 e+yj0+tiVcDpuHiESnhMX7rlnMeUtiFZ5ZK2+C8LV2JfHJCXwClRcdmoWuaShWP7lk
	 zl8B/u2p21Bl7+uV4q6DBnvWXj7k9qEiEz4LfJDvcvkUzKpHLXHzJrMA9V2FypQDlx
	 b7f7b4ZaWZO4xy7H7AJzODJxvdGcOOXvitIYsQItLa6Ctqmw8qJHAFXeK889flpIFO
	 jtCJSDf3ffsrUs51SsrcWbhftO7yotlUvrK3H6NmrcIXtmrOUzUmH+yrKhFfmdk6SD
	 kU2Nx9XND1L8Q==
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89a14be4733so4522456d6.2
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 15:24:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YybJq3LYXicIxNX2qwgkFRzHIc9myxmKHyDA3ZyPuQWv7ICdN2D
	6lnUWiJAYnfIVMUUaoFhA8E0d/EN6Mhl+QxjI+dEJdUhRzj+JQYQB2MlVEAqnVzR6r6bwANXG9C
	96/OMD/qK6jDiUY+8jGWepilOd92rGLE=
X-Received: by 2002:a05:6214:62b:b0:89a:73c:babd with SMTP id
 6a1803df08f44-89a66a6c92emr56326186d6.27.1773267846694; Wed, 11 Mar 2026
 15:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307050250.3767489-1-yonghong.song@linux.dev>
In-Reply-To: <20260307050250.3767489-1-yonghong.song@linux.dev>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 15:23:55 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6NVTTE8m8OWEaiWhdL14GqkWSZMeOOrAo0FKsry2jrFA@mail.gmail.com>
X-Gm-Features: AaiRm51QMHljYY2EirQncO_nM0tq77sPO79debvbSjmaWoHa-3d5kYlw5Ix15-U
Message-ID: <CAPhsuW6NVTTE8m8OWEaiWhdL14GqkWSZMeOOrAo0FKsry2jrFA@mail.gmail.com>
Subject: Re: [PATCH kbuild v2] kbuild: Reduce the number of compiler-generated
 suffixes for clang thin-lto build
To: Yonghong Song <yonghong.song@linux.dev>
Cc: linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, kernel-team@fb.com, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11869-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lpc.events:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 714D326ADED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 6, 2026 at 9:03=E2=80=AFPM Yonghong Song <yonghong.song@linux.d=
ev> wrote:
>
> The current clang thin-lto build often produces lots of symbols with
> suffix. The following is a partial list of such function call symbols:
>     ...
>     ethnl_module_fw_flash_ntf.llvm.7631589765585346066
>     __nf_conntrack_alloc.llvm.6438426151906658917
>     tcp_can_early_drop.llvm.11937612064648250727
>     tcp_print_conntrack.llvm.11937612064648250727
>     ...
>
> In my particular build with current bpf-next, the number of '*.llvm.<hash=
>'
> function calls is 1212. As the side effect of cross-file inlining,
> some static variables may be promoted with '*.llvm.<hash>' as well.
> In my same setup, the number of variables with such suffixes is 9.
>
> Such symbols make kernel live patching difficult since
>   - a minor code change will change the hash and then the '*.llvm.<hash>'
>     symbol becomes another one with a different hash. Sometimes, maybe
>     the suffix is gone.
>   - a previous source-level symbol may become a one with suffix after liv=
e
>     patching code.
>
> In [1], Song Liu suggested to reduce the number of '*.llvm.<hash>' functi=
ons
> to make live patch easier. In respond of this, I implemented this
> in llvm ([2]). The same thin-lto build with [2] only has two symbols with
> suffix:
>     m_stop.llvm.14460341347352036579
>     m_next.llvm.14460341347352036579
> This should make live patch much easier.
>
> To support suffix symbol reduction, two lld flags are necessary to enable
> this feature in kernel:
>     - Flag '--lto-whole-program-visibility' is needed as it ensures that =
all
>       non-assembly files are available in the same thin-lto lld, which is=
 true
>       for kernel.
>     - Flag '-mllvm -always-rename-promoted-locals=3Dfalse' is needed to e=
nable
>       suffix reduction. Currently in llvm [1], only process mode is suppo=
rted.
>       There is another distributed mode (across different processes or ev=
en
>       different machines) which is not supported yet ([2]). The kernel us=
es
>       process mode so it should work.
>
> The assembly files may have some global functions/data which may potentia=
lly
> conflict with thin-lto global symbols after the above two flags. But such=
 assembly
> global symbols are limited and tend to be uniquely named for its context.
> Hence the conflict with globals in non-assembly codes is rare. If indeed =
the
> conflict happens, we can rename either of them to avoid conflicts.
>
> Nathan Chancellor suggested the following under thin-lto:
>   KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility -ml=
lvm -always-rename-promoted-locals=3Dfalse)
> The '-mllvm -always-rename-promoted-locals=3Dfalse' flag is only availabl=
e for llvm23.
> So for llvm22 or earlier, the above KBUILD_LDFLAGS will ignore those two =
flags.
> For llvm23 and later, two flags will be added to KBUILD_LDFLAGS.
>
>   [1] https://lpc.events/event/19/contributions/2212
>   [2] https://github.com/llvm/llvm-project/pull/178587
>
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>

Acked-by: Song Liu <song@kernel.org>

Thanks for making this improvement happen!


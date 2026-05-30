Return-Path: <linux-kbuild+bounces-13434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AkMM4W5GmqC7wgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13434-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 12:18:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3082D60C0ED
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 12:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE4ED3042593
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 10:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6BC395273;
	Sat, 30 May 2026 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0DwDLWM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAB3386C39
	for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136289; cv=pass; b=h1K8Nv5QXuUy8MVU/DFKokjpr1Gu4An+BFL2AoHp7DuSUHP6ueoG2H9DGwAmtBf0l0BGwFJDKE0rCTsDEbjB9W7Nb80HXpSgPkzh72+oKKEfZt5C9jsAgFAdEa8ekO6q/lW/JNbI//KH49seJctvukNqrgKIpQj+w5XqlN6BYbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136289; c=relaxed/simple;
	bh=88Mpui27trfRvDycoOcLtNBGUBsAL4SF86wsePJZCw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIuvT0VBqts8eVKeTDYc45TjILP7TuiU5Ii4xBqfEcD3vGSxe+kzNeqiUyCRcTEE/TR1uzDLVZ8whXe21ITR4qbqSEa8pi6Eei+RTFawejx8+WWjR0uTEIBQE7CGkUMAk5rueS946WSYUxdqY7mGcztXIz4MH+mbYLFjoDE7PfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0DwDLWM; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3042a99f0ceso925231eec.0
        for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 03:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780136287; cv=none;
        d=google.com; s=arc-20240605;
        b=CZK01XhHFW/wieYL7I0celA19IANXakeMPKETTZllN9fL16SbqNhmJYEfj9hpbnf75
         1Pa72NjGN7ABP2YCJqkNkBq+bJUOkkI92H6merVdpUYqbRE/oW58AgnagVlCdN7dq9sz
         Xj5kINuwRfb/kpDon0Ew4wWd01r0gX/r4UM/ahxvnhwfzCRPoxNgJLSi2pHz9LjyX3+L
         12Du5t3EX9VW8zPmt3fzMieT5TI1PUyevHgwQlUU2eveXer/1++dzydAU+FYTdetrVf3
         HtfApRXvID+FcF655q0Ug5sP00nioAvKBo30A2gPtk8C/mJTDTKrMyCbDejt+KbovZrJ
         CnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=88Mpui27trfRvDycoOcLtNBGUBsAL4SF86wsePJZCw4=;
        fh=JytW0ImawnKwL9/uFig+VZOthA0oP/x+AnHrpbKrZ04=;
        b=a4tn/8Ly407J4Au7BFdNgs4CgWMBKFByxA5MROwB3aCs/M5DkBYa2gEpRIYn/XDTHN
         Ztq1KkKCKhYlRJEcUv3b1c9y8RbVMhQsdvn9SQ2kj3LmfPOwqEcPT4pTBU2wesZZAVxl
         1+hZkJRIUItTPmhPpnoHFeGwohvOj6caFzKlNZSZeHVXQkGNne6U9Zal4BdOez9zvvgY
         lVJ20Se+IOKOWrMe09u83V7OGvXPphTI101mtk94E3qvx5EkEQx7pByAesBLWAK+IQPc
         n4O64EMscrhZnMsdZjeQUIjkN5mh4YX6ZKZFv0Ol3ZPDZS6biztGG5uLIyr8W4Z+VAKn
         R8/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780136287; x=1780741087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88Mpui27trfRvDycoOcLtNBGUBsAL4SF86wsePJZCw4=;
        b=H0DwDLWMLUOJyUqmr59prlD0Yla1eG05hxOLnUuDY0mLTQGA40IksdiT8pEgNUU+xQ
         dwdjbH6s+FTuO/6w7CrhkijXQeDd/VGxVmuQPK6sURlaFbllotVV5YliTHAbEKUSwH/f
         q4oCR9mc/xLZy6a9ViFQ4kddrwPYI+EchXkD2Dvgbv6EVb0dbHcmoc68P46lUPp9Nyan
         VEyfhUAJLD08y7iWnLg9U36J1moCi/cniSGu/xuipKyzI5L7fJQIbRl3loMBGmOYvUQZ
         4R8OAsiEVi4AiNCidaLEMFoMFQymtT5b/4HB8H2uG4L31ZU3Nmv8aoA88AdTkTLrm2NC
         D9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780136287; x=1780741087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88Mpui27trfRvDycoOcLtNBGUBsAL4SF86wsePJZCw4=;
        b=CPPCJl9Ky7gxjmirO2y1HwGGbdhNSNkiti3DcT4yRG8J8+yoJvwDwUMVvmAtAW6yuL
         xGtY7S8BrRNb/aZ7MjsLHnsv1/eO76bnC750Z1anemg02NBsmGxES/2sGz1R9fE1HbDH
         gIMHCd5iEneF/j+0KgS3iJzddw1WaCj2oEDiOd/mQAlm/G0shUtZCpfPCswlziag4aVP
         VOPvAI1ximJKyfz3ngWIiyxrekQhQEKmxoWLPbzXfeD4cvJP4HJyzIEoPIpNXsiuKk10
         bB2/K1Mp3qB1r572s6tiC4IB177CqQWjxP4RkfBGV8CrAOqQupnNHZoviR6O2nVxwpOW
         OILA==
X-Forwarded-Encrypted: i=1; AFNElJ9H8R74j+VzeeDQ5GTLJ/gBXpUM3wJ+vIhwoSw3867Zj/BQn3EKd1Vlx1AAFsWSf0cIBssPsJv9yObTunA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4QqIEVUCAZddNoeNBTGEvbxJPQnvHSfkmKYuUBhscNOpyVFGs
	Yg+HpGKXUCSIyQHT2DpygDOexWLiQvuHNppfrGJrZqj6MVDOhlLNRUsHHSUE20UtcYuufvN8ThQ
	NqPYzE/R+1g+HV1PgDAeWK21M+hv7nK/mmLR+
X-Gm-Gg: Acq92OFD2eZx9yrcAa7YC0Ky0+6OdinNsLbqMCXPxjcSHzTZg+jcd9ZiJq6OrOtH/v4
	TYIPf2TYYGxqUX3kXp5C6fEZEYK5DjslT+klHqVbXyiduzP+qc60WzrWG32u4N+fdbOMBnU19f4
	51zkLX/bR9o1NBEgYH+JSpdZ7dlvL/pv5Pl6SVXNvsr/I7K4Z8XHOEc8DGMsGhe33z+kDxcHFXv
	WuYS7gQbHGlw0aMg7q0Ho4sfu84smUEh+oq2pvaUApSo/nKItxgXEslDAtZ9C0j/qrBhwpCzhbv
	3H4fJff+qO6e/fHDiiNkC1/aLLmUyHUU7lZ/xB1wlC1FFtC9pWy57oVIiRi/pAep3GbRsoDTjov
	u+2LaUsauNY7ZSH1w5BOYWObEnpo7I9PLFQ==
X-Received: by 2002:a05:7300:ef83:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304fa67adabmr772144eec.6.1780136287248; Sat, 30 May 2026
 03:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530085821.19689-1-litvindev@gmail.com>
In-Reply-To: <20260530085821.19689-1-litvindev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 12:17:54 +0200
X-Gm-Features: AVHnY4LoscA6yPn51ROUDeMBOyo94K6YEFuKt2ZXOLZkSnzQoiSb5zRDWtZJ9YE
Message-ID: <CANiq72mBkBxGk4CbTrjeNYZ5ZUsD=wVfLVyP2Bcm_v9BExQaGQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope"
 command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
To: Sergei Litvin <litvindev@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13434-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3082D60C0ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 10:58=E2=80=AFAM Sergei Litvin <litvindev@gmail.com=
> wrote:
>
> When executing the command `make COMPILED_SOURCE=3D1 cscope`, the `cscope=
.files`
> file generated by it includes filenames with the extensions *.rlib, *.rme=
ta,
> and *.so (taken from *.cmd files, which, in turn, are generated from *.d
> dependency files by the `fixdep` utility).

The commit message does not say "what" has changed (or "how"), only
the "why" (which is the most important part, but still... :)

In addition, please provide a changelog after the `---` line, i.e. why
did the patch change from v1? For instance, was it due to Sashiko's
feedback? Something else?

Finally, Cc'ing Kbuild.

Cheers,
Miguel


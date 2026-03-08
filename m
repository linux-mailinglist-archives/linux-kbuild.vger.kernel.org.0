Return-Path: <linux-kbuild+bounces-11679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGRPACq5rWk+6gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11679-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 19:00:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA69231804
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 19:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B10E2301494B
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 17:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C92385522;
	Sun,  8 Mar 2026 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKCPe0gv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EBC3939BC
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Mar 2026 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772992794; cv=pass; b=JpnMEjnAuKrhyQngutFDVl/ZOlqVklZ8/kPbNUsa3A75QSNQEzJcBv9EyQvZtHqBxKUiDEK7MUVBORiQO+ommbLsEXCdqasHPlZRhlEcIl46wgPLwjQcvetzoSB974R7I5eLOdXCn7nIBWroOnlA1oQ4Yg8N0kjwLucbNzgbQ5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772992794; c=relaxed/simple;
	bh=+zlVKH89gfjeRUlJZEVKdTi58Q9rgr+fXJ3dbeicI44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRS5wNi0w8CpDikj6UGneGCuQQrlsKrf4M3b0eQxTiVWEWz/6vkHsE2l8xXXU0+6h7UqJATnXZ7wy1yApJ+XMrW4kLJ0YiqwgvT1gV1RCxtNX5RLWx9dONTT+jmSpJgWOXbiXJ9SxEMjmZilzY6qW5HenbVffAiSicY0CXghZTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKCPe0gv; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so4211797a12.0
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Mar 2026 10:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772992792; cv=none;
        d=google.com; s=arc-20240605;
        b=kUsAmnSGtmcSwUoyjgZTstvNjK650ImQ33QYH59DVezVxQgzg+Hb7+fbyregEOxVzW
         TrnymEeLBcmF1Dm/+Nuf/XAOFOuASlRDtyIITrz6DnZFBnA5EhJXidVNdX+Ivkfi40i9
         DHKRbVoJH5srqxc6sYBVj083v34gOM7HgyUjje40q0paxJY7OLOqnk6UysoZ3Oa7y9hj
         r20qFMYxAc25sCRbmjBcu5q4phOLptPovNUQmAFnBg6D5175Wt2pFzOlSAR0iT6Ao+OU
         zv2gzCMYh20sY0+eX9WVPI0GjnFc6ftuHa0q44OVJR8ud1MAHJZfmoUJEcXMdJtIuwJL
         IRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+zlVKH89gfjeRUlJZEVKdTi58Q9rgr+fXJ3dbeicI44=;
        fh=/YG45wILX2NA6nks23mRo+rBjwGh75HIlWFrRYNs7M8=;
        b=XWA1eOxAnrZLX/6z+h7oPpsaFBDNReE7w2OVz+PFd42Je0UyovjL3JJ6S8fUHYJ/MC
         Ktnbro+egq+Zq+IQpkjGH1euIEQ9ZPuoH/0abkzuPlqiZ80myXTPDPYxTk3RTc50rTfh
         iQ8HKjM0orLjHBilCQF1OeeM0aec4vJ7OD9Yjhnzi8PBfr+RwJPVqpjbubmspg3ZFIgI
         sHtsMSrRIwUmWBUhtmK4aJZ90K8IW4w10elMsmGxb/SfuFBfF64449yfESq8wdBqDcdS
         dthMA1EtNDC0tXdxXhJ7EqnkEIXHgUT+RHEccjXAZBm8asA6ySV/F4kADarx/tqvh90m
         W7wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772992792; x=1773597592; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+zlVKH89gfjeRUlJZEVKdTi58Q9rgr+fXJ3dbeicI44=;
        b=mKCPe0gvI6lwCT149S+a2dyTCi90ltC1fWtJ+sM21Ggs5lYerPfqK2ZgfwHSa/mFBn
         eNgbK2GuLWaaMttSIQRwZS4luHgGM0NkjKZ2wHwmSvqM/VBrCgWu86apKPGNKu8/+IZE
         fb/1L8YzosB1JCTnzP0HdAnCvJVKFJ6udN+vFbUQs34lcxPErjnI4GrjxNXUcXNAgDlb
         3RifC37Mm6mPWIelZggnSVe8N0Y7aPPhBs9Mwkyu68UQXXyr743nKSLooRLWlKvHO23L
         ck2ffselLIlnaHpyixR4Fv5jpNwHYluuiuCtZndrhsBt3P0fosUgRGvy5xrM0FLo2DIA
         skOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772992792; x=1773597592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zlVKH89gfjeRUlJZEVKdTi58Q9rgr+fXJ3dbeicI44=;
        b=NJrE/decf0iYsk6gyyhGg2orjVJ1P4SoyRZuFsz5xOj1FcS2Sy/AviBMg+EXp4qIMJ
         iwiIZg+Q5lwjMoa7xy+IhkoWmKEt7QG3FUiWmMTd9VtnSbo+h1ImGYZiCQE54MHcrqX1
         tikE6cfz6vuR0i6ZPasbTnt4by9Pzi0c/LZEWU+53GjUeXaRRhgF3wnnyTRjqS8u5CCF
         RJzYC6scTQAhVoDO2Zuy/vrPxDbqQktuiqcg5EfEHvPcbKvdY3ZkUGTG3HFnpRCvm9QT
         erfNe7z+Mx18MsCy9ts8AisHpv86wAcJmYILW2cJTqXMVX//LFRnGBloLXcph3j+4zUA
         hIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8KaGCkHp62NiFkXp5XloROHnZhOE5a6fT+ypAL2GeYoKfckR+UN2CxAKLZh6Lg4DP1TQe3sn+l5GeDso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Ln762XDjDylYxbIj84PRMZVvb1+Xvnc2uSRwN2n5jdy5dQjH
	QBxYYOh+cTREu/lPBXUSWnLA6T2sSmTtKMDHJNNA+9FwlfS4IG73oql9ZCkQun6q05tk3rz7rSL
	oJmHwQLFP4U4i5UbCKKVtDgXg4JKymVQ=
X-Gm-Gg: ATEYQzwsRN1USsKeJg8LmyCZ4XKKhXUik2bdXE+lcURgFPaRILTLW+jxE08vvwcXn3P
	d2r2fZXX7/aDMns8uSfTZAahMxx2O6mxR0nCNKua379gD7dF6tsruIJUZHCny8ytkIpTvSgbKye
	DpuBuEpD6160/TX6Vq+IaG2QJf5z36Q40ap+3xQ65WCJouyBVRfD5Tbnpjbi31kMSHl3JzBEuEN
	D6yEHdD1A5pJ1xvEinfk0qr5vChzVqaBfAtd+4ZJ5LiOtd5q+/EzVwMfsUSCFqCQJ8g7nKLvVS9
	Z5xcqH3bedtHto5WFNMcVrfB5lTfre1Z6YXfMo3l
X-Received: by 2002:a05:6a21:7a8c:b0:395:1511:7221 with SMTP id
 adf61e73a8af0-398590b3e55mr8164874637.59.1772992792474; Sun, 08 Mar 2026
 10:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
 <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
 <20251028174541.GA1548965@ax162> <CAB95QARtzDWensRzui3d-7+jhymcFBOBi78ev9LMy=ZFJMDCTA@mail.gmail.com>
 <20251031220732.GA2254630@ax162> <CAMj1kXF2kKyEOc6KSBfbdUMf5m4o=DLZXk4++C3q-utA_9g4DA@mail.gmail.com>
 <CAB95QARrcOc6h9=YTzLKkNE0dEaivtiLfK0kEQ1jNp+v1w4yzA@mail.gmail.com>
 <CAMj1kXG_kPx5=3Qbn6ZTpKqOYh-mehwrH+d6Bw8QEPqvhZy1nw@mail.gmail.com>
 <CAB95QAS__YYYBLc3KFjBUg_QqC3AOB0y6kvhSqZFR9fx7BDKvg@mail.gmail.com>
 <CAB95QAQyzYTrnGrkrcwXJ7Za37v7VsvwsmUezb1Z4VsF_RdLMQ@mail.gmail.com> <20260307080852.GA2685454@ax162>
In-Reply-To: <20260307080852.GA2685454@ax162>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sun, 8 Mar 2026 18:59:41 +0100
X-Gm-Features: AaiRm51Q-mwFFzcCYcQ0gGBweDAd_ZH2ze6fBzsV79svmwP8WlpkqP_KrpQPNQ4
Message-ID: <CAB95QASTAG2nTJxN7CRDD65hhNKnbHky_Fjj5O4JExMobtaMAA@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 5EA69231804
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11679-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.909];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eugeneshalygin@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Nathan,

On Sat, 7 Mar 2026 at 09:08, Nathan Chancellor <nathan@kernel.org> wrote:
> Small necro bump: I think this might be fixed in mainline now with
> commit 8678591b4746 ("kbuild: Split .modinfo out from ELF_DETAILS"). It
> should apply relatively cleanly to stable versions (and should make its
> way there in due time due to the stable tag).

Thank you, I will try rEFInd again, although the project looks abandoned.

Cheers,
Eugene


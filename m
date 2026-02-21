Return-Path: <linux-kbuild+bounces-11348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOQsEl/5mGmoOgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11348-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Feb 2026 01:16:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1C216B88E
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Feb 2026 01:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 890E0300E3C5
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Feb 2026 00:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8E9F4FA;
	Sat, 21 Feb 2026 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmyGnR+c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA31C68F
	for <linux-kbuild@vger.kernel.org>; Sat, 21 Feb 2026 00:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771632988; cv=none; b=CKWTlJaBTRgoaWHjvCP9tAq0GU7sCSbz3G16Hg8em/7N88Gc1ufqyAjcSITHGs3cf4Mja6XBDikbkT8X6+aPGQo4uYHZCbWDyhjcTmQAqOqAqfreY59Pi1vBEtAMMKAQ9zesoS/SoTpBguZHz5AxnhrVdEaz+YD93YFXRlLg4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771632988; c=relaxed/simple;
	bh=3CyBu6t4VMRW7+VaTdEqeBQZt8ryLT8L+AYTjT70+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6Oq8ef4PAOwMDtshaEjMxNpCWekvhRBQHn6cz2DWsFPlXxfp4xlC0nUqgO47HgQTH3WQEjyY5RUdEWHbRG7ixHi878IkMVSzp31RAkcWtkybf4vYvw14133YmrcHjASTavA5+5a6MOpxLwaGLGwez7OtRLT2sGvocbWNnaXHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmyGnR+c; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483487335c2so24213055e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Feb 2026 16:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771632985; x=1772237785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT8043eXb3x0Y28ESC3KU+eLsSvxZ0GN6RPVeedqxFo=;
        b=gmyGnR+cTByphmKcMVQaGwrgyNnOc4mBuocXd2Bt1JNeS6DrZMvCUw7QWjM3nipa4y
         bjyuuE7o1mZcN6cHm6gHllEBqLgCoq+83y4PNmNan+G7O20r5zx1ZojRa3qS8ZwAyWOM
         uJuxLdRlotZuh4uqIYlx+EAMDXF9H6luBhKZFECbATtuPqwTGwXvAhI+VMt8NLZUsotA
         7ZHQh50HCA1hRnJ17+A2P/PER9XokOBnW3WzBQsc3KhTDSZhjDdHcC15l9EWrwQLzHdw
         TbCysF5cXa36FJTpIJiCxyDQnSe39LAowaXGxmpbdhvS/D5jrv8Gxud/WlBAs4Wcuvvv
         8rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771632985; x=1772237785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pT8043eXb3x0Y28ESC3KU+eLsSvxZ0GN6RPVeedqxFo=;
        b=a7Mqtl+YOh6PGmbH/kholoP6M6R0PEFFbTK+4rAal0CHcim1o/nwmPgPjLJfr6Ylxj
         y8ggjGm/ajN+QqfGYrqY6wfzWofTgkg/olA3frGSmwMfX3BlXrkRlWny0YDbww9mfqmB
         IbREJlSSc9ZrYPGk0wndU5tnTPJIaztBnciG9uSwqxoDNBUVlZvxBmVWFca36D5atoGt
         AlZr+hvF63EUTwT3+98gI3+37TMi4BjnQc+EdaWlp7s0DHn2CSKIJrMXUE/8zGEUbroO
         tbMX7QyL+iq5TXJT6D1tu0ffzdwC4BN4MZo/sgP9mohc5l+EHu+Svqe30j67gCqqO/U3
         +OwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkhoeZXIxovXnJR64ovvKYdsljilHZ3D6cjup7q+zwAvmX3hmPigdT64lR5VGfs7tWyCT76dLj2Z8aMSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69q2Bad8eKvnp1T/01RFNWcufcpRw7TTB4KI+E0xDpoBmbDFF
	hf8WC4J8NSc3J7CCJrgX240DlmpRcUad9gbXNbFbMZ/bHGFlaC2TEmts
X-Gm-Gg: AZuq6aL/SMhUNEGazl9v69oJo+e1g9nU0zsb8a8C5P6OtaJgyTNKk+Pl03/OGI67zGp
	16MwIrg5adQCeGB2OX8dlkhuCWlzkzWcetPN0PiFMOpM7e14Fknxyfs+KmijRgbVVVBzc8sKIrf
	3lof5dAVXShUmKnRY2QRcWL+DkZJt2TX9R/aUczQrHn7Pemxi4i+fykLgBvi4shE7pe40zzaN0V
	bXaCuQuQGt303yOkEjnJuUJJO4lAsV2hlkN9gJ3Vfui3jJiYXvzEEdjip7qA3Mp3uEkK4+maPmS
	sahs3lhnnzxW60VKY68pLYB9DXKSpsxWkIf8IAdlOmZICySQbGCqlylZUqqpl2knwC971KVcWUx
	ycyO53sAm4pNhzc9Oh+XWN1K2Rfrg79Jt3mahCyG8f4QG1DGeWRXGii/zwdfnpfIAUZyW9q5A0J
	zRD8JlBmrv5KS4uFidnog=
X-Received: by 2002:a05:600c:1d15:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-483a95bc0cbmr16930615e9.8.1771632985095;
        Fri, 20 Feb 2026 16:16:25 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-483a42cd49fsm38764515e9.5.2026.02.20.16.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 16:16:23 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: ddiss@suse.de
Cc: brauner@kernel.org,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	patches@lists.linux.dev,
	rdunlap@infradead.org,
	rob@landley.net,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH 2/2] init: ensure that /dev/null is (nearly) always available in initramfs
Date: Sat, 21 Feb 2026 03:16:09 +0300
Message-ID: <20260221001610.820321-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220112606.551099f5.ddiss@suse.de>
References: <20260220112606.551099f5.ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11348-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,android.com:url]
X-Rspamd-Queue-Id: BE1C216B88E
X-Rspamd-Action: no action

David Disseldorp <ddiss@suse.de>:
> It looks as though Bionic has extra logic to handle missing /dev/null
> during early boot, although it's dependent on !is_AT_SECURE:
>   https://cs.android.com/android/platform/superproject/main/+/main:bionic/libc/bionic/libc_init_common.cpp;drc=a7637a8f06f103c53d61a400a6b66f48f2da32be;l=400
> 
> I think this would be better addressed via documentation (e.g. in Bionic
> or ramfs-rootfs-initramfs.rst).

Okay, I see, current bionic behavior is good.

Okay, I agree that this /dev/null patch is not necessary.

-- 
Askar Safin


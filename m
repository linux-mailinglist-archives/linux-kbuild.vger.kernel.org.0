Return-Path: <linux-kbuild+bounces-13339-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NR2NMTYFWpYdAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13339-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 19:30:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E115DAB25
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 19:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61AC430DD8FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 17:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B4038B7DC;
	Tue, 26 May 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=toralf.foerster@gmx.de header.b="pPnyJd+f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4783C4B93;
	Tue, 26 May 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815856; cv=none; b=If/2eYOTtbhdb8hfIz98q4z0wYZf2mleOGH+JSNgkYVydW6lGVueAcvhdKZuQnyaoFlYJ9jD3IdfpbIvkYK99orUQyyL77V0Ohn7TXG2/jOFbRB/3M3THwoIdoAFOh4vRKA8xmdXpkdFeRZ/bTG9uw/7pQpOgWhCbD0FgicJGus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815856; c=relaxed/simple;
	bh=Ezx9CexjfkGSC3vS29LB1GYJEEoUC1krz5CV1VYSKf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=STiV8oQFA7me7Pyf0QATv5FJgZklDgE2hobYsioDbnwLzO6DMmqRogwYRYGctbZqAUOZN1tIiG2kuxbhlBzDcqq8YVNNV27dJrlBlXmG29tAjy1lnyizeHwrnPFAYhFVGcOoLusIrY442mcEsOcKuWd0zHbfUQRT9ueFdAflsQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=toralf.foerster@gmx.de header.b=pPnyJd+f; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779815852; x=1780420652; i=toralf.foerster@gmx.de;
	bh=Ezx9CexjfkGSC3vS29LB1GYJEEoUC1krz5CV1VYSKf0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pPnyJd+fyBuNpVj++MFqPOSBlailql8SVZGnJ6nKy2xXNIMDLxCkm00eJMaC/ksf
	 3EwpJHQuVvRbSheADnheqhMV0EW0zm42OhsgO5ZVFCp6+jUqQWdiUGNHVb7XTXz23
	 A4tS0FnXP4bxzkw11kUgEAJAqZzok+lHILx3zGYTUFqpCw97UPG6/zkMdrzGkxrK7
	 x/Kzn7QEZCV3XD20pr0ko//Gya9h1cMOBYv+RoolJ/SnE+aUYmXam4CKHNesoJMzc
	 RIEwo85vPotgHXM5b0EQ/4f0X/wwe+mLfA67QQgkq3Mg6t4cmXPssYtuXnU6b71VQ
	 vXhTBbUNvkSkjRJVIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDysg-1wZedE1FvY-00DE2V; Tue, 26
 May 2026 19:17:32 +0200
Message-ID: <5d93170f-4356-40ab-ba9c-6016a78680a1@gmx.de>
Date: Tue, 26 May 2026 19:17:31 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: build failure for stablerc
Content-Language: en-US
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild
 <linux-kbuild@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
References: <a47f9124-15b3-4dbc-a211-6161eb98406c@gmx.de>
 <a4ac44fa-146b-4b13-bf42-0c8cff601ed2@suse.com>
From: =?UTF-8?Q?Toralf_F=C3=B6rster?= <toralf.foerster@gmx.de>
Autocrypt: addr=toralf.foerster@gmx.de; keydata=
 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
In-Reply-To: <a4ac44fa-146b-4b13-bf42-0c8cff601ed2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:60aktEaDTcezKWGTYUWs3l2n0XQ9gwyGlTDaleEuX2xij+nGyBe
 DbdRGhc5vVKyAlGgC3vByrudbogYQbatuSdXPQe4iz9zpXMc19EDZjGLy6gCOLIHhiYYOJi
 MQAAdpH+9l0d9slAS46o3I2qoZtsvsjcal+d/sprVfRE2PKoUfOBhUlR5Mc57H8WRhXa4Si
 5v6bNzQaB5XjPaEeh/doQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aIC/O9g7eoQ=;rsRrID/xtNwMD3/7FXZ7ICuO6rH
 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
 jnUE9/7mgr6NSPUykWF1WakQ==
X-Spamd-Result: default: False [-1.53 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13339-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[toralf.foerster@gmx.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmx.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 79E115DAB25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 09:31, Petr Pavlu wrote:
> Gendwarfksyms requires libdw, see Documentation/kbuild/gendwarfksyms.rst
> [1]. Is the library and its development files installed on your system?
That was it - I've to install libdw-dev under Ubuntu-26.04.

Thx.

=2D-=20
Toralf



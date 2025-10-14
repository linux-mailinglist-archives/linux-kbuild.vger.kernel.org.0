Return-Path: <linux-kbuild+bounces-9118-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7A3BD8092
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 09:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D1F3B2BD5
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 07:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319E030EF6F;
	Tue, 14 Oct 2025 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b="kVN1SbHC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.commetrax.com (mail.commetrax.com [141.95.18.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D230EF76
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.18.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428577; cv=none; b=B3qdRPUc32VY9KoyS5P3JLFKVkeaMBr5NYujlBK6ke7ItiyvEJF8BReB3NxEF6j+7chzmaM1jle1lZcFOuimG1lr9huNLOjniYwplFW0ayYwVMmruNs/u4+MdTKrE8eiCh8egSrXOk/gZlifgYL/X7XMquZvTsSKebWCI1VMki0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428577; c=relaxed/simple;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=LLQ8WiwdKkQhCU7zlLf8o58SeEgmGLyNJgHQwOAqCXqDovAHr8Xc+zJg7ydJfE6bMYlsLTAdjUEsM4Fie8Phh/p6Nsn+pP6zYwkq3MxRIPDLRfXVYcwSTqbEzFBmBNc3pCbtAw/o5+d5oWwjQ4ernlmDLxhxCXFloRS/pyJO0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com; spf=pass smtp.mailfrom=commetrax.com; dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b=kVN1SbHC; arc=none smtp.client-ip=141.95.18.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=commetrax.com
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 6EE4C24174; Tue, 14 Oct 2025 09:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1760428572;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Date:From:To:Subject:From;
	b=kVN1SbHCgWBuj+jLAKNIvXFOjNOb5Uaivv+qREI1laDydCA3CDbE5ABELh9IoQfOB
	 5Ua/yyFisIbn6ymYEAAc10aDdsYm7zcNPhO+GrBEkYRIEZbbJPL4h257yMyRqDhVva
	 2cPR2ZHMlnw3sZzn2Y7ULM+h3a27jZkMJ5nSOjy2DJ3deFpYIJcLbP7OKq1CJzbAvM
	 HxKvvy2J1xwwnocYfeHSJTScIUdcbkGnoghZOzAAFe+LPhMLl5woV9GQ17iAUJLHEo
	 zw4vVPlwYzBLKj9F12YbtInPwgBQjjtyjezckB0zjLb+tM4jscN+wKKxOT6RXMluxF
	 IhTX9cLWFwfNg==
Received: by mail.commetrax.com for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 07:55:46 GMT
Message-ID: <20251014084500-0.1.c9.16n8w.0.uw3hhyg38x@commetrax.com>
Date: Tue, 14 Oct 2025 07:55:46 GMT
From: "Luke Walsh" <luke.walsh@commetrax.com>
To: <linux-kbuild@vger.kernel.org>
Subject: Welders ready to work
X-Mailer: mail.commetrax.com
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

we support companies in carrying out industrial projects by providing wel=
ding and assembly of steel structures =E2=80=93 both on-site and in-house=
=2E

In practice, this means we enter with a ready team of welders and fitters=
, take responsibility for preparing the components, their installation an=
d quality control.=20

The client receives a complete, safe and timely delivered structure.

If you have projects that require steel solutions, we would be happy to t=
alk about how we can take over this part of the work and relieve your tea=
m.

Would you be open to a short conversation?


Best regards
Luke Walsh


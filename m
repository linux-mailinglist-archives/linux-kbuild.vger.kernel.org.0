Return-Path: <linux-kbuild+bounces-8327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D2B1F039
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 23:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2B1C1C2631F
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 21:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2BF19DF9A;
	Fri,  8 Aug 2025 21:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hJO91sER"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C6725743D
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2025 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754688161; cv=none; b=GSdd2cYOwbiWoPgn69TJ4sJXV7Pofnzo6G5JanDWuOwwZH/RUzfyjaYFdPibUPD809HVjYsGakoX0HuBg1A8Qh3rqBGFc0TipXh9PFkYJOb3k+nkaqtbLkZFoLQ9K4/Lz2A8Xzi3ZjtkP6LAGG+cMnOYtyNPPI+PFyBAj8B80yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754688161; c=relaxed/simple;
	bh=c/KZKgJxhZrOFz7j/8Rp8TRwHMHJ0DzYDikGRkIOTd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WddvW90NNyiihMCZMgUCZJPX4iaD0U5mfZCxPq2+T2thc28xTs+4fL+M9OV551ojmEmRm7rKjJLP4JCk2KvsYut2DQrezYyzRLV+Sa0AUQ2H8nmk0S5k9xq5hMf+33PbzyXg84eHnhKghpWa0tWlAmy8Qp89xHoZeN0PBK75Ijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hJO91sER; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=K72JbRZ6GRsR3tgAl7Jbx/8Igb20eXSOyt2ZVgmkSmI=; b=hJO91sERvaScgQGcmjPawloA4p
	Juo1UNfNgMQIMea9KDMUn3mRIBOcm9Q37GrZ6WbBsh264GGl3afhOwr98AvREV4V6GycskgOCxvud
	FttahjR8B0ND21CJBDWg+XMDxnyDzhSUAE0JtxbmpvNvbOjSnGw+X4bbo1q0POR0d1PElksCkP7m7
	3Ph0diC1WBRe6jXFDX4FoX86vNuzVO2OQecvj5aivrRlAu6Ymsy4a1nBjKg1xtElPJ48yPrK3rK8K
	rXG4Vg39XmBoZQCqty3Tcc8D4t/cEJB7jKu6A4jOjRnmArA5+exLdOm+FeMLwqxXffISlwcQOk2uU
	oexTMeWA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukUXt-00000003jG7-0jqP;
	Fri, 08 Aug 2025 21:22:37 +0000
Message-ID: <440b9eb7-6c38-4fc0-aa54-5f06014d0a3a@infradead.org>
Date: Fri, 8 Aug 2025 14:22:35 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to build custom amd64 module.
To: "David F." <df7729@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
 <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org>
 <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
 <CAGRSmLsxTH_sq6Vm0A_v6m0u2USrG981NhBoyJCS1hwY+bENCg@mail.gmail.com>
 <4cdde960-f897-4a17-8a5b-18fbbced4da1@infradead.org>
 <e7a71f76-ce38-46af-bc81-997f796ac911@infradead.org>
 <CAGRSmLu5bEwLPZ+8EHZTC9MxGB0e_-HckyhYDKjzz66pgW02Kg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAGRSmLu5bEwLPZ+8EHZTC9MxGB0e_-HckyhYDKjzz66pgW02Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/8/25 12:54 PM, David F. wrote:
> I'll have to either patch the makefile to not use objtool or replace
> it with an empty script.   The highly optimized asm based object file
> is binary only and works as it should, the call is expected.
> 

so did you try what the documentation suggests:

11. file.o: warning: unannotated intra-function call

    This warning means that a direct call is done to a destination which
    is not at the beginning of a function. If this is a legit call, you
    can remove this warning by putting the ANNOTATE_INTRA_FUNCTION_CALL
    directive right before the call.


> Should I choose the route to patch the makefile, which item needs to
> be removed, I tried a couple places in makefile.build but it still
> wanted to call it.

Sorry, I have no idea. I've never looked into doing that.
You tried modifying these with no success?

# 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
# 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
# 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file

with an example in tools/objtool/Documentation/objtool.txt:

- To skip validation of a file, add

    OBJECT_FILES_NON_STANDARD_filename.o := y

  to the Makefile.


-- 
~Randy



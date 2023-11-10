Return-Path: <linux-kbuild+bounces-13-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 960607E83D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 21:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36EAE1F20F21
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 20:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7573F1D53E;
	Fri, 10 Nov 2023 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="kc4eUhHS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B0F3B798
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2023 20:34:37 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6507D272C
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2023 12:34:35 -0800 (PST)
Received: from webmail.free.fr (unknown [172.20.246.2])
	(Authenticated sender: vivien.gallinaro@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPA id 2746219F5AF;
	Fri, 10 Nov 2023 21:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1699648473;
	bh=6D7bLP7ZPujkMNWR06qz0Yrd27QuA9ckxsiMx3/JYYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kc4eUhHSz1DvO2Ur7WVfOBN+54WP+E8pROWu+TQXLEYZErdESGQM/MY0HXuk9bnLE
	 vsSXcvjyTGGjLL7HyjduyqfWgElARerv5gcJvq3LeZvmWf1IyZQeDC1pXQFJcJsiJH
	 nEZhzyWI3paqPgl6iJKLbb+guyzf/KknEcfxcl2X00+8jwts680tlAj8p7cXnpEDBS
	 9jhH7EpM0cxdO6cINM3O8e/kzIqYSm18p6/br4ksq42Y5fzqkyKP7vGX6egSMxVWRM
	 E8DgQIAtzNhECTjNBvVb/T1IydVWjneKU3A9t14BFfVa9todiWh9uRwsgkbtHfUu0D
	 uTVGnR+PMFBOQ==
Received: from 2a01:e0a:2b0:9080:1e01:8392:432:b1d
 via 2a01:e0a:2b0:9080:1e01:8392:432:b1d
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Nov 2023 21:34:30 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 10 Nov 2023 21:34:30 +0100
From: Vivien Gallinaro <vivien.gallinaro@free.fr>
To: linux-kbuild@vger.kernel.org
Cc: Jesse T <mr.bossman075@gmail.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: SymSearch can cause make nconfig to segfault
In-Reply-To: <1aab6cfd-1b87-42a8-9beb-02073bdf9add@infradead.org>
References: <5ec262711df2f3d3ccd84930ed4e9778@free.fr>
 <CAJFTR8Sfea5gCpYA+Xb5vAz=0nemrQNxSf5BFeD0jM+YfagpmA@mail.gmail.com>
 <1aab6cfd-1b87-42a8-9beb-02073bdf9add@infradead.org>
User-Agent: Webmail Free/1.6.5
Message-ID: <0cdc8c536da1e4bf5d7bae311c759f21@free.fr>
X-Sender: vivien.gallinaro@free.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit


On 11/8/23, Randy Dunlap wrote:
> On 11/7/23, Jesse T wrote:
>> On 11/7/23 Vivien Gallinaro wrote:
>>> 
>>> For a fresh 6.6 kernel :
>>> $ cd linux-6.6
>>> $ make mrproper
>>> $ make nconfig 2>../blarb
>>> (<F8> x86 <enter>)
>>> $ reset
>> 
>> I'm assuming "reset" here means you got put back into your shell and 
>> are
>> resetting the terminal state.

Exactly.

>> I can not recreate this error on my machine unfortunately are you
>> using the tar release?
>> What distro are you using?

Gentoo, but checking with the (then) stable 6.6 tarball.

> I also cannot recreate this issue.
> FWIW.
> 
> More info needed.

That was good news. I tried to investigate a little deeper with strace, 
gdb… a little too deep for me actually. Then I eventually remembered: 
even though my install is pretty fresh, I've been a bit sloppy on 
maintenance, leaving one stuff to the side to catter to another, a few 
times over. One global update later — meaning I only have /usr/src in a 
corny state, now — I don't get the segfault either. Sorry, pebkac.

Thanks for your time,
VG



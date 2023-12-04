Return-Path: <linux-kbuild+bounces-254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93888803176
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Dec 2023 12:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91A3C1C2074F
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Dec 2023 11:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234E422EE0;
	Mon,  4 Dec 2023 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="Vj+KIEB0"
X-Original-To: linux-kbuild@vger.kernel.org
X-Greylist: delayed 444 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Dec 2023 03:25:21 PST
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::119])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE92F19A5
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Dec 2023 03:25:21 -0800 (PST)
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  4 Dec 2023 12:17:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1701688675; bh=aGkUrjrf2Bd0jPpMXffD2gS7xY90WZq7FUKU/C/NXpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vj+KIEB0nTU/Zn6kBIstfu/O0Q8tMYJ4j9WsQYTgrBufJBQQkRi4//zDpYJbO4zzR
	 eDkBUi5NzD7JJZJVl+d07/sqdsfALb8YNeZQfow6kyPsnJQ03w+9FCdp6vYFg/dbLM
	 EsRfxMvzqGWNzSu46q7JaybZMYMcOBXB3BlF8RM0=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 01DB3806BD;
	Mon,  4 Dec 2023 12:17:55 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id E74951812D3; Mon,  4 Dec 2023 12:17:54 +0100 (CET)
Date: Mon, 4 Dec 2023 12:17:54 +0100
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: determine base DTB by suffix
Message-ID: <ZW21Yu73Uan+HcbL@buildd.core.avm.de>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org
References: <20231203080548.1869540-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231203080548.1869540-1-masahiroy@kernel.org>
X-purgate-ID: 149429::1701688675-BDEE2A59-FAB33F4C/0/0
X-purgate-type: clean
X-purgate-size: 762
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Sun, Dec 03, 2023 at 05:05:48PM +0900, Masahiro Yamada wrote:
> When using the -dtbs syntax, you need to ensure to list the base first,
> as follows:
> 
>     foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
>     dtb-y := foo.dtb
> 
> You cannot do this arrangement:
> 
>     foo-dtbs := foo_overlay1.dtbo foo_overlay2.dtbo foo_base.dtb
> 
> This restriction comes from $(firstword ...), but it is unneeded to
> rely on the order in the -dtbs syntax.
> 
> Instead, you can simply determine the base by suffix because the
> base (*.dtb) and overlays (*.dtbo) use different suffixes.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Thanks, looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


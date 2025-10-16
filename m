Return-Path: <linux-kbuild+bounces-9197-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B24BE2D6B
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 12:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BE33234FDBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC5227B33B;
	Thu, 16 Oct 2025 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cqcaOxj9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/DctJzVe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cqcaOxj9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/DctJzVe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C82BDC34
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Oct 2025 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611118; cv=none; b=LMfbrV97rWl7oUBz19xBVS4x2t2W5AW0oxZUWnFh7nvDsc81a4P/KJdE2SavgUUw0trBTJgQsA2isJEereDj/3jp/XmbyU9JU6185+ANmVLsv5bKOiX/BJKzMYfM8fUQtMBN3OuCU3aVvZkObsUdkhvlpb3W0J/S/my45IyrgOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611118; c=relaxed/simple;
	bh=WeAwZvfIRCq2jKgXl8RRekajMBbiqC668zLvqe7Q5yg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TSlzToAM1AsmdsAbo5nVtdb0jKWjiQf9vkRwlnKc+7TAnEeYijwwF/f8UuS0s6BFIE2ESWJE6Yw+CRhiYzHCoM1tBzQA2H+mfnBldzaoWrHWdUNUIUaWfeo3k7mmefHxSnLWJU0IZtnsI28niBI3gvx3eQ397jPDUbnu0+PnrMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cqcaOxj9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/DctJzVe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cqcaOxj9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/DctJzVe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C5111F7A0;
	Thu, 16 Oct 2025 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760611114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qYw2EOZh/rXSs97oJ5jLLmuLBel7y8+HjLK0q0azhI=;
	b=cqcaOxj9rqeE/fdGWH80vy5HsiOwZCcj3HOGmUieUlK9EoCIcJuI36pa1Unqmo/uyA1W8p
	y13x625PW7LqMZqADaZgjaBUNVqga8/J1W205ZKNRAiSVFEassdRqvFAl0wE6XS4M0hZmG
	n4Lnjix2vi760/ZmVltwio49zRQxb8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760611114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qYw2EOZh/rXSs97oJ5jLLmuLBel7y8+HjLK0q0azhI=;
	b=/DctJzVe+g5cl98rPchv+Y9jyUhV3G1Bq6qD/BL71xx99PIxAqf2D6+8tqTGH7oS4WTDsm
	VLK1rTDXH1D6z8Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cqcaOxj9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/DctJzVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760611114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qYw2EOZh/rXSs97oJ5jLLmuLBel7y8+HjLK0q0azhI=;
	b=cqcaOxj9rqeE/fdGWH80vy5HsiOwZCcj3HOGmUieUlK9EoCIcJuI36pa1Unqmo/uyA1W8p
	y13x625PW7LqMZqADaZgjaBUNVqga8/J1W205ZKNRAiSVFEassdRqvFAl0wE6XS4M0hZmG
	n4Lnjix2vi760/ZmVltwio49zRQxb8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760611114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qYw2EOZh/rXSs97oJ5jLLmuLBel7y8+HjLK0q0azhI=;
	b=/DctJzVe+g5cl98rPchv+Y9jyUhV3G1Bq6qD/BL71xx99PIxAqf2D6+8tqTGH7oS4WTDsm
	VLK1rTDXH1D6z8Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60EC91376E;
	Thu, 16 Oct 2025 10:38:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AN3xBijL8GiKGQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Thu, 16 Oct 2025 10:38:32 +0000
Date: Thu, 16 Oct 2025 21:38:25 +1100
From: David Disseldorp <ddiss@suse.de>
To: Gang Yan <gang.yan@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org, Gang Yan
 <yangang@kylinos.cn>
Subject: Re: [PATCH] kbuild: doc: describe the error caused by pre-epoch
 timestamp
Message-ID: <20251016213825.4d93e36d.ddiss@suse.de>
In-Reply-To: <20251016060856.982288-1-gang.yan@linux.dev>
References: <20251016060856.982288-1-gang.yan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5C5111F7A0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 16 Oct 2025 14:08:55 +0800, Gang Yan wrote:

> From: Gang Yan <yangang@kylinos.cn>
> 
> This patch documents the compilation error that occurs with a pre-epoch
> KBUILD_BUILD_TIMESTAMP. By providing an example command and the resulting
> error, it helps users identify and avoid this issue.

Adding the example is helpful, but my preference would to use a valid
one (which can be copied).

> Suggested-by: David Disseldorp <ddiss@suse.de>
> Signed-off-by: Gang Yan <yangang@kylinos.cn>
> ---
>  Documentation/kbuild/kbuild.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 3388a10f2dcc..1ffc782d2061 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -331,6 +331,15 @@ UTS_VERSION definition (uname -v in the running kernel). The value has to
>  be a string that can be passed to date -d. E.g.:

   <valid example here>

> The default value
>  is the output of the date command at one point during build.
>  
> +However, when the date command retrieves a timestamp that falls into
> +pre-epoch times (i.e., dates before the Unix epoch, January 1, 1970),
> +the kernel will raise an error during the compilation of initramfs. E.g.::

This assumes CONFIG_BLK_DEV_INITRD=y, and doesn't cover why initramfs
uses the date in the first place. How about reworking it to something
like the following:

  If provided, this timestamp will also be used for mtime fields within
  any initramfs archive. Initramfs mtimes are 32-bit, so dates before
  the 1970 Unix epoch, or after 2106-02-07 06:28:15 UTC will fail.

With that, feel free to add:
Reviewed-by: David Disseldorp <ddiss@suse.de>

Thanks, David


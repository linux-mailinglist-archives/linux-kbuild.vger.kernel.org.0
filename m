Return-Path: <linux-kbuild+bounces-4898-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 546169DAEA9
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 21:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A378282588
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 20:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2276B201261;
	Wed, 27 Nov 2024 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="Jcp/etHk";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="axOlhXBz";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="uQ7H2Byq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1319885D
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Nov 2024 20:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732740927; cv=none; b=kEsN4zHB5T7G/O91GuDhDhpRjXHew3NkCZvNcDNb5F2NCUKm7lG6vSwCAnNuFf4bNbRfig9z2Va3aM45aYejn95IWWhC2FxxRojDz7LFFGHzFc9LSfa67GG20ig6BZ4LuMz6MYIzRaSi/A4CRZvDedm1wZgUHh3OWBXk4im3frw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732740927; c=relaxed/simple;
	bh=em50niaeJ/+DFKfLB8owqRPQ+e0oCNG4MKo4HwmVwYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eu91CFILpnyH+QNLEE622Pq87NHMQnt40p83ifsXppOFdjCzLMBPlCmIxRw0I9yzL3nxqBtDSOjpP5/8GgKTgCO9XmOrKE7inS6guD21IHWjSvxZBf7EBuR/60/6Pb2zYVKLTnt73MowFDjNL28SsY0iPqZoiQk2GHk11ENmRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=Jcp/etHk reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=axOlhXBz; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=uQ7H2Byq; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1732741812; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=2WINOyRzo695WtaTsQIcd3pK9JHKA4hoY8eCup6zQQo=; b=Jcp/etHkoFEoBl3SzSc8uDOySw
	XWCSmuX+dqM/yh+XzmSGurG5m5vU3LplI6moybdVyNujpG8s+soB9kiFoVE1CjAn52Gjp+kzp21Yq
	tfN4tjLEO2bJh1yY7NuFEZlKn2MHY2FTSNm8O8fO8IjYGoc3pdQZnDL9YjMw/i8EJPB7XaTSgJhHd
	Kr+QYGlEucH2wtIKx1vZEyKXTRIOW2InqvcBGfzb6ToHgPq17Y1C394AHfEBJMevkxFlzu7fuv3H9
	7ag/+5ZKLrw3RxzZXee5THYuPPA1VNiALKrB9GsLPs3uFToXw9O7sRTBxfMZzI5fRy9IWTDfcCAc9
	0eOHcfFw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1732740912; h=from : subject :
 to : message-id : date;
 bh=2WINOyRzo695WtaTsQIcd3pK9JHKA4hoY8eCup6zQQo=;
 b=axOlhXBzuGwXGf2pQ995LomndYcBpLfgY1lTEgppe73YFo8ZE07hfHoqDVv9fcCCaag/S
 3EgThZ6sKpU35Yo66vv0yqS+/Yy8bT+CpN1Qth2EJf3iCTDIg3DdGycnF+HxJ9jgt22T1jb
 Hl+tGI+Zy8nEGiscJmm9p62nGt5J0STExz7nVB+LiYv+Hj0G3JQ8hOVa9P3UoJBn+D7/An+
 +oc37rnZUyPm+1l0gP3JgapduThuI911mFkk4OPsLsoh4DgvD7Z1NY1j2FhimsJE0C/naF2
 Uie+VmUM3B680ovURgbOpC+S0Q6yMeF9bH0IRzXHt83vGHqqkEUOaMnCGmYA==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1tGP0o-qt4KpM-ES; Wed, 27 Nov 2024 20:51:50 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1tGP0n-FnQW0hPueOx-n8LA; Wed, 27 Nov 2024 20:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1732740708; bh=em50niaeJ/+DFKfLB8owqRPQ+e0oCNG4MKo4HwmVwYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uQ7H2ByqwM2bNS8kgFd/4tj6GiGvQlM2GnCKAi3M4xf21iew9DK6D9Xdcb3NXe9Yv
 6mYzAWAjgdzB7R/bNUJu77oJCxUdo+Avf4pssR+q/9Sk5QOsrpnOjsoK4qb5u1cYz7
 L8/W3ZuIE5Sm3ISPZaha3/h2Mv24Zm3yzqibezQA=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 1F0C93CDEB; Wed, 27 Nov 2024 21:51:48 +0100 (CET)
Date: Wed, 27 Nov 2024 21:51:47 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH-next] modpost: Remove logically dead condition
Message-ID: <Z0eGY_6e9jVMezxE@fjasle.eu>
References: <20241127162904.28182-1-advaitdhamorikar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241127162904.28182-1-advaitdhamorikar@gmail.com>
X-Smtpcorp-Track: f9h3sipZk3W7.NGx6LglMOzuj.KY3CPA4NXfw
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sXt6ANBR9r
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Wed, Nov 27, 2024 at 09:59:04PM +0530 Advait Dhamorikar wrote:
> In case of failure vsnprintf returns `pos`, an unsigned long integer.
> An unsigned value can never be negative, so this test will always evaluat=
e=20
> the same way.=20

'man vsnprintf' on my system reveals a different behaviour:

| The  functions  snprintf() and vsnprintf() do not
| write more than size bytes (including the  termi=E2=80=90
| nating  null  byte  ('\0')).   If  the output was
| truncated due to  this  limit,  then  the  return
| value  is the number of characters (excluding the
| terminating null  byte)  which  would  have  been
| written  to  the final string if enough space had
| been available.  Thus, a return value of size  or
| more  means  that the output was truncated.  (See
| also below under NOTES.)
|
| If an output error  is  encountered,  a  negative
| value is returned.

vsnprintf prototypes also indicate 'int' as return type.  What is the sourc=
e of your mentioned findings?

Kind regards,
Nicolas



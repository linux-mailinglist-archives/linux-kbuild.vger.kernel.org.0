Return-Path: <linux-kbuild+bounces-13860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PIIvGQmwOmpmDwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13860-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 18:10:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF06B8970
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 18:10:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=E+OfX2Kx;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13860-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13860-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 593803039C79
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 16:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6263E30CDBC;
	Tue, 23 Jun 2026 16:10:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE230D410;
	Tue, 23 Jun 2026 16:10:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231046; cv=none; b=NNDEsdD3FKnD7mArfoS64rmZBUSugShx5iZ2h6l8Gyh4egKsamfYKek15Exb8RhY2DY5QxSBJWOr94V+0JLlj7dpYm/I8/navSnqtj8EGTc7hy2Q9RQMwmJuRlGack57xtfZDeyOzKiQpRuQhCQ/XkFnycdSX+1hJF35HJ+5ivc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231046; c=relaxed/simple;
	bh=wWvMXfjrWCeJKu4Ntx+JySZPuCcNrV9PPz1N5AAuDnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTYqlS68MjVg6nAak8SX0E3pUVuSPQLvBFn95kZ1SJTuB+4e0YdOVQdwGvGTzdWxzpTq2fSkcyxKV0Mj3CvYhzY+egqATzx5KtwactE7ewaj8yzfiA/z1K+H+y+O1UbGydKK76NUEAae1toktKdDq4nRvgo5Tdp08sM+kYtvrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+OfX2Kx; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782231044; x=1813767044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wWvMXfjrWCeJKu4Ntx+JySZPuCcNrV9PPz1N5AAuDnI=;
  b=E+OfX2Kx/9tiYLHFsuTuSmCo0p0K/FGPYg0UToEVD3YFyGOscvKXkN4W
   F8dDld6bqY6VLShQev0pJaM6TyeO1etw9Emaz/dBmvLrM9gQV5k+fGs8K
   ca7iwTR2LtfW/rJoL4liJOCpp7woP94G2XIH1pSpAp4h5hZzesuBSkNBv
   59P7npxMynQNfDmHIt5BkAgMB9d/5x7r5719vMqJ/4xWZOMuNcaxolw9e
   jgKhu+46JxaUY3g3ChMecvyGG8kWqgR1eAl83HKzqhbYH7YF6uMniNq+e
   3pFs/UgguOxM/lQ09LnK16c/7AINcNVc/oPjAF9AAOFqRi7BGSX5q+1yW
   w==;
X-CSE-ConnectionGUID: Z7ziyRg8TbGdkGfE1VwKNQ==
X-CSE-MsgGUID: lUaXwJ7DSI2xlULhxMcNag==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="70495228"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="70495228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 09:10:44 -0700
X-CSE-ConnectionGUID: 7mrp2mDlRA23lQlKmJNlcQ==
X-CSE-MsgGUID: LJOm3gISQvaOKgOGTRO6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="245188529"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 09:10:41 -0700
Date: Tue, 23 Jun 2026 19:10:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: Andrew Jones <andrew.jones@linux.dev>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org,
	tfiga@chromium.org
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <ajqv_zGbMzuDZlp8@ashevche-desk.local>
References: <ajo4DVWoSaEZtBDa@google.com>
 <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
 <f2520b56-59d8-45d1-8f38-90f2472c96e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2520b56-59d8-45d1-8f38-90f2472c96e9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:andrew.jones@linux.dev,m:senozhatsky@chromium.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:tfiga@chromium.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13860-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,vger.kernel.org:from_smtp,linux.intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDCF06B8970

On Tue, Jun 23, 2026 at 04:25:15PM +0100, Julian Braha wrote:
> On 6/23/26 16:18, Andrew Jones wrote:
> 
> >> I wonder if you have seen KCONFIG_WARN_UNKNOWN_SYMBOLS which seem
> >> to be addressing the same (or very similar) problem (unless I'm missing
> >> something).
> 
> > Thanks, Sergey. I wasn't aware of this. Is there a way to combine that
> 
> The two tools do not do the same thing. One is a check on .config and
> the other is a check on the Kconfig spec.

...otherwise Sergey should never been able to cleanly build kernels
for a long time, I suppose.

> Drew and Sergey, please try each other's checks.

-- 
With Best Regards,
Andy Shevchenko




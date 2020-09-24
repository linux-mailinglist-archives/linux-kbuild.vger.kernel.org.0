Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DE3277850
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Sep 2020 20:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgIXSNj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Sep 2020 14:13:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:7229 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbgIXSNi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Sep 2020 14:13:38 -0400
IronPort-SDR: a/djZr5ntzpdlnZaZ8kkF6kQAu6xfgk7P0F+ha+Kq/ZVkN1a4kGJ+z7fcVoKSN+pjnNWn4jSJS
 /tykWhHFu1Gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="140732721"
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; 
   d="scan'208";a="140732721"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 11:13:38 -0700
IronPort-SDR: fQ9Tzp6ZRlcYFB2KRWD+hrbPicg63xexfZDY9TywMs7EyZYknrFoEklc6Wf1tjfflX17drqm9E
 l1Kk1E9OFesg==
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; 
   d="scan'208";a="291322958"
Received: from vanidesa-mobl.amr.corp.intel.com (HELO [10.209.65.234]) ([10.209.65.234])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 11:13:36 -0700
Subject: Re: [PATCH] modpost: allow modpost to fail on warnings
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Filipe Brandenburger <filbranden@google.com>,
        Greg Thelen <gthelen@google.com>,
        Michael Davidson <md@google.com>,
        Eugene Surovegin <surovegin@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20200918215010.250580-1-pierre-louis.bossart@linux.intel.com>
 <CAK7LNATUcRpCvu9iQd_s9i5+3kRA96O+DMd-QGbAu-swmVuauw@mail.gmail.com>
 <d14745a6-fbdc-ff84-5553-18af6d922989@linux.intel.com>
 <CAK7LNAQfm5GVH93zAJakB1JpyS1qf93qTUETofOstSJ9jcky3w@mail.gmail.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c9d19777-9027-0bb6-8590-1bfeac14b33f@linux.intel.com>
Date:   Thu, 24 Sep 2020 13:13:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQfm5GVH93zAJakB1JpyS1qf93qTUETofOstSJ9jcky3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



>>> I think [1] should be an error instead of a warning
>>> by default.
>>
>> would the following patch be what you have in mind?
> 
> 
> No.
> error() does not exist.
> 
> merror() exists, but the difference from warn()
> is just a prefix.
> 
> If any error happens, modpost should return the error code.

Sorry, I am not able to understand your recommendation. Existing code 
which calls merror() does not exit with an error code, e.g.

static void sym_update_namespace(const char *symname, const char *namespace)
{
	struct symbol *s = find_symbol(symname);

	/*
	 * That symbol should have been created earlier and thus this is
	 * actually an assertion.
	 */
	if (!s) {
		merror("Could not update namespace(%s) for symbol %s\n",
		       namespace, symname);
		return;
	}

What would be suggestion be then in this case?

change all functions to return -EINVAL after each use of merror() or 
something?

Or just add an exit(1) after all uses of merror()?

>> If yes, also wondering if we can still add the option to treat warnings
>> as errors as an opt-in behavior?
> 
> 
> I want to add a new option only when it is necessary to do so.
> 
> I am not sure which warnings are real warnings.

That was the point of the suggested option, treat all warnings as errors 
and ignore the warning if it's no big deal. it's standard with gcc 
-Werror, it's be good to extend this to modpost - or what would be the 
drawback of doing so?

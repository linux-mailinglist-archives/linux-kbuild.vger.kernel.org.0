Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37470442D31
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Nov 2021 12:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhKBLxk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Nov 2021 07:53:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229720AbhKBLxj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Nov 2021 07:53:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8BAA60F5A;
        Tue,  2 Nov 2021 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635853864;
        bh=dqJN2Gi6q7TPSF77o6RQLRWPsFd/JVJbppmgYInfGv8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=nrrauIoQWCLjHnJV4rwpOzX2ac87/ZtDlNMSEV6MKg9vOdLreBYmoyc400xNpNfZH
         Rmlrf0jQyLtJf0bllBRc/QbwTFmsYDUHzvbpHyzge1yqnJMbkl7+ClMHQZuVD+nrwi
         9mcmwp/ccnxVm2h8ufjseCAb1CvvSdTKYrpuR8a+7KF6FrGojKjOzCWy3m7biDn1y4
         YccZjkRj4nGzGozfqBeNmQDckxGzLZHpgY0eSaR+ZDPfGckr38ti02CHrkaQCKmXMO
         DcQt0m2nCwh0DzPoqkG2UFMsDNtBh9tysmL8ZF6pM9wfvFFWjqZ3UvDT/rjnChGuAZ
         32I5UGdrp6ahg==
Date:   Tue, 2 Nov 2021 12:50:59 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/6] MODULE_DEVICE_TABLE() support for the ISHTP bus
In-Reply-To: <85cb78cd-92d9-69ed-9360-f5d6f8f904af@redhat.com>
Message-ID: <nycvar.YFH.7.76.2111021249520.12554@cbobk.fhfr.pm>
References: <20211029152901.297939-1-linux@weissschuh.net> <883db585-c9bb-5255-4ddd-f093616af1a1@redhat.com> <1bb82b37-06e4-4937-ba0d-57fd301eaf2e@t-8ch.de> <85cb78cd-92d9-69ed-9360-f5d6f8f904af@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 1 Nov 2021, Hans de Goede wrote:

> >> Since most of the changes here are under drivers/hid and since the latter
> >> patches depend on 1/6, I believe it would be best to merge the entire series
> >> through the HID tree, here is my ack for this:
> >>
> >> Acked-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > Please note that patch 6 modifies a driver that is not yet available in the HID
> > and 5.15 trees but only in pdx86/for-next.
> 
> Right, but given where we are in the cycle this is going to be something to
> merge post 5.16-rc1 anyways which resolves the dependency issue.
> 
> I guess it might be good to send this our in a later pull-req as a fix series
> for a later 5.16-rc# though, to avoid the eclite and chrome-ec drivers from
> autoloading on all systems with an ISH, even though they usually will not be
> used there.

I'll be happy to take this as 5.16 fixups after the merge window is over 
(I am not adding anything new to the branches now, before Linus merges HID 
tree), but I'd still like to see Ack from Srinivas.

Thanks,

-- 
Jiri Kosina
SUSE Labs


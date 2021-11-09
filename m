Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C85C44ABB8
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Nov 2021 11:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243872AbhKIKpE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Nov 2021 05:45:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:46754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240799AbhKIKpC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Nov 2021 05:45:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5E0661054;
        Tue,  9 Nov 2021 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636454536;
        bh=SARQ0rfZIk7IiaCvVk31ChFv0tDhc8L0s3fOf2R/g+0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=a7exq0YD94v0zjUkhQ40CSdtgS4WGps5RaHgFFtYM1RjwIiaq2xOiNNP0oGsUQlSP
         M+DD2giXMocWC+ssEbA/V/u1kkbZUCCidJNE2Hxv1QlxUOVQVsdGzGOUat3QiFOV9o
         CY1Y2IbSJmDFhSaiOYRJcb6ZtAAmVNdu38r0xsLyFplnpsWfr1Fugf2HRyBVfr4pH4
         QgG41ij0ruqhDOInQ3igH+ZCXHhX2oCF2v/ENyLejAs24Jgx+HDbQXVfOHdEgJ8PCL
         2mfb5UrwCFtcFxAO99niG6q070h6m41z41GehOxHvT/06WgSWDPBAFfk1AIlgeBUd5
         IPBhwCVnCSqXA==
Date:   Tue, 9 Nov 2021 11:42:12 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/6] MODULE_DEVICE_TABLE() support for the ISHTP bus
In-Reply-To: <20211029152901.297939-1-linux@weissschuh.net>
Message-ID: <nycvar.YFH.7.76.2111091141550.12554@cbobk.fhfr.pm>
References: <20211029152901.297939-1-linux@weissschuh.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 29 Oct 2021, Thomas Weißschuh wrote:

> Currently as soon as any ISHTP device appears all available ISHTP device
> drivers are loaded automatically.
> This series extends the MODULE_DEVICE_TABLE() functionality to properly handle
> the ishtp bus and switches the drivers over to use it.
> 
> Patch 1 adds the infrastructure to handle ishtp devices via MODULE_DEVICE_TABLE()
> Patch 2 replaces some inlined constants with ones now defined by mod_devicetable.h
> Patches 3-6 migrate all ishtp drivers to MODULE_DEVICE_TABLE()
> 
> Note: This patchset is based on the pdx86/for-next tree because that contains
> one of the drivers that is not yet in the other trees.
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> 
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org

Applied to hid.git#for-5.16/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

